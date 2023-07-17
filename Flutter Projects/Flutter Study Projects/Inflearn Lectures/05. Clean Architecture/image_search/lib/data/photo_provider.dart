import 'package:flutter/cupertino.dart';
import 'package:image_search/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  const PhotoProvider({
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

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    // 변경된 상태를 다시 전달하기 위한 규칙을 설정
    return oldWidget.api != api;
  }
}
