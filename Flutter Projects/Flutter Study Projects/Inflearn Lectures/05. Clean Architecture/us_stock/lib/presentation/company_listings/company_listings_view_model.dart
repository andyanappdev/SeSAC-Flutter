import 'package:flutter/material.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_listings/company_listings_state.dart';
import 'package:us_stock/util/result.dart';

class CompanyListingsViewModel with ChangeNotifier {
  final StockRepository _repository;

  CompanyListingsState _state = CompanyListingsState();

  // getter
  CompanyListingsState get state => _state;

  CompanyListingsViewModel(this._repository) {
    _getCompanyListings();
  }

  Future<void> _getCompanyListings({bool fetchFromRemote = false, String query = '',}) async {
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