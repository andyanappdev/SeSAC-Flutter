import 'package:injectable/injectable.dart';
import 'package:memo_refactoring/domain/repository/title_repository.dart';

@dev
@Singleton(as: TitleRepository)
class MockTitleRepositoryImpl implements TitleRepository {
  @override
  String getTitle() {
    return 'Test Ver. Memo';
  }
}
