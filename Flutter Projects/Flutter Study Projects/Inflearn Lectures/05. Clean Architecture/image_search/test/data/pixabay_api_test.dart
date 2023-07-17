import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/model/photo.dart';

void main() {
  test('Test of Pixabay Api', () async {
    final api = PhotoApiRepositoryImpl(PixabayApi(Client()));

    final Result<List<Photo>> result = await api.fetch('apple');

    expect((result as Success<List<Photo>>).data.first.id, 634572);
  });
}
