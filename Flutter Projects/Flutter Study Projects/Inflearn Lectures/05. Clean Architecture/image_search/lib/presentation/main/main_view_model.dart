import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/domain/model/photo.dart';

class MainViewModel {
  final PixabayApi api;

  final StreamController<List<Photo>> _photoStreamController =
      StreamController<List<Photo>>()
        ..add([]); // add([]) 초기에 StreamController에 아무것도 담겨 있지 않기 때문에

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  MainViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
