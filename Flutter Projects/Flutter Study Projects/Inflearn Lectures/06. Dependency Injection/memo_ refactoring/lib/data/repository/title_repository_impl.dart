import 'package:injectable/injectable.dart';
import 'package:memo_refactoring/domain/repository/title_repository.dart';

@prod
@Singleton(as: TitleRepository)
class TitleRepositoryImpl implements TitleRepository {
  @override
  String getTitle() {
    return 'Your Memo';
  }
}
