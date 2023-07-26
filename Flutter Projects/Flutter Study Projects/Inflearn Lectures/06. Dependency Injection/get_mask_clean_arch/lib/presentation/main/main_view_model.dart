import 'package:flutter/material.dart';
import 'package:get_mask_clean_arch/domain/use_case/get_near_by_stores_use_case.dart';
import 'package:get_mask_clean_arch/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetNearByStoresUseCase _getNearByStoresUseCase;

  MainState _state = const MainState();

  // getter
  MainState get state => _state;

  MainViewModel(this._getNearByStoresUseCase) {
    getStores();
  }

  Future<void> getStores() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      stores: await _getNearByStoresUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }
}
