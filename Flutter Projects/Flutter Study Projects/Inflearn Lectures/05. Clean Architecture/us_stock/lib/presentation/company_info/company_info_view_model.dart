import 'package:flutter/cupertino.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_info/company_info_state.dart';
import 'package:us_stock/util/result.dart';

class CompanyInfoViewModel with ChangeNotifier {
  final StockRepository _repository;

  CompanyInfoState _state = const CompanyInfoState();
  CompanyInfoState get state => _state; // getter

  CompanyInfoViewModel(this._repository, String symbol) {
    loadCompanyInfo(symbol);
  }

  Future<void> loadCompanyInfo(String symbol) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getCompanyInfo(symbol);
    switch (result) {
      case Success(:final data):
        _state = state.copyWith(
          companyInfo: data,
          isLoading: false,
          errorMessage: null,
        );
      case Error(:final e):
        _state = state.copyWith(
          companyInfo: null,
          isLoading: false,
          errorMessage: e.toString(),
        );
    }
    notifyListeners();

    final intradayInfo = await _repository.getIntradayInfo(symbol);
    switch (intradayInfo) {
      case Success(:final data):
        _state = state.copyWith(
          stockInfo: data,
          isLoading: false,
          errorMessage: null,
        );
      case Error(:final e):
        _state = state.copyWith(
          stockInfo: [],
          isLoading: false,
          errorMessage: e.toString(),
        );
    }
    notifyListeners();
  }
}
