import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/main/main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos =>
      UnmodifiableListView(_photos); // getter

  final StreamController<MainUiEvent> _eventController =
      StreamController<MainUiEvent>();
  Stream<MainUiEvent> get eventStream => _eventController.stream;

  bool _isLoading = false;
  bool get isLoading => _isLoading; // getter

  MainViewModel(this.repository);

  Future<void> fetch(String query) async {
    _isLoading = true;
    notifyListeners();

    final Result<List<Photo>> result = await repository.fetch(query);

    switch (result) {
      case Success(:final data):
        _photos = data;
        notifyListeners();
      case Error(:final e):
        // error 처리 코드
        _eventController.add(MainUiEvent.showSnackBar(e));
    }

    _isLoading = false;
    notifyListeners();
  }
}
