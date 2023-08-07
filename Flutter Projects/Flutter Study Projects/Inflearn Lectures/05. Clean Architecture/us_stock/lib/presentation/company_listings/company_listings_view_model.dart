import 'dart:async';

import 'package:flutter/material.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_listings/company_listings_event.dart';
import 'package:us_stock/presentation/company_listings/company_listings_state.dart';
import 'package:us_stock/util/result.dart';

class CompanyListingsViewModel with ChangeNotifier {
  final StockRepository _repository;

  CompanyListingsState _state = const CompanyListingsState();
  CompanyListingsState get state => _state; // getter

  Timer? _debounce; // debounce용 타이머

  CompanyListingsViewModel(this._repository) {
    _getCompanyListings();
  }

  void onEvent(CompanyListingsEvent action) {
    switch (action) {
      case Refresh():
        _getCompanyListings(fetchFromRemote: true);
      case SearchQueryChange(:final query):
        _debounce?.cancel();
        // query가 입력되고 500ms 이후에 실행되도록
        // (사용자 빠르게 타입하는 것을 모두 반영하지 않고 약간의 딜레이를 주기 위해)
        _debounce = Timer(const Duration(milliseconds: 300), () {
          _getCompanyListings(query: query);
        });
    }
  }

  Future<void> _getCompanyListings({
    bool fetchFromRemote = false,
    String query = '',
  }) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _repository.getCompanyListing(fetchFromRemote, query);
    switch (result) {
      case Success(:final data):
        _state = state.copyWith(companies: data);
      case Error(:final e):
        print('Error Remote: ' + e.toString());
    }

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }
}
