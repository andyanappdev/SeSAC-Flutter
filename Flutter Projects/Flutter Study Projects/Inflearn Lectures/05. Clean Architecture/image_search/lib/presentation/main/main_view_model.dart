import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/main/main_state.dart';
import 'package:image_search/presentation/main/main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  MainState _state = const MainState([], false);
  // getter
  MainState get state => _state;

  final StreamController<MainUiEvent> _eventController =
      StreamController<MainUiEvent>();
  // getter
  Stream<MainUiEvent> get eventStream => _eventController.stream;

  MainViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUseCase(query);

    switch (result) {
      case Success(:final data):
        _state = _state.copyWith(photos: data);
        notifyListeners();
      case Error(:final e):
        // error 처리 코드
        _eventController.add(MainUiEvent.showSnackBar(e));
    }

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
