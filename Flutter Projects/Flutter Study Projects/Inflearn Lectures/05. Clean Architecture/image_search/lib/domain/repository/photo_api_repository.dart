import 'package:image_search/domain/model/photo.dart';

// 특정 API의 의존성을 제거 하기 위하여 추상화 인터페이스를 정의하여 이를 채택하는 곳에서 구체적인 구현하도록
abstract interface class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
