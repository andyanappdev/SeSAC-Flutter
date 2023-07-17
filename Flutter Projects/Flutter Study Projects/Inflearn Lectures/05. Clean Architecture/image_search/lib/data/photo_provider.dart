import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/domain/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  final StreamController<List<Photo>> _photoStreamController =
      StreamController<List<Photo>>()
        ..add([]); // add([]) 초기에 StreamController에 아무것도 담겨 있지 않기 때문에

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    super.key,
    required this.api,
    required super.child,
  });

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    // 변경된 상태를 다시 전달하기 위한 규칙을 설정
    return oldWidget.api != api;
  }
}
