import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';

class MainViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos =>
      UnmodifiableListView(_photos); // getter

  MainViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
