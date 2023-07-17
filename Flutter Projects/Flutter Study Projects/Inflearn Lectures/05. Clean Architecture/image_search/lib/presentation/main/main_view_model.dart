import 'dart:async';

import 'package:image_search/data/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';

class MainViewModel {
  final PhotoApiRepository repository;

  final StreamController<List<Photo>> _photoStreamController = StreamController<
      List<Photo>>()
    ..add(
        []); // ..add([]) 초기에 StreamController에 아무것도 담겨 있지 않기 때문에 빈 리스트를 담아서 인디게이터가 계속 돌아가는 것을 방지

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  MainViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
