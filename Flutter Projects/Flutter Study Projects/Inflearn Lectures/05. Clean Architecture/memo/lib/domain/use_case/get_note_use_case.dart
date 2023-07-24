import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

// notes screen에서 노트를 클릭했을때 해당 노트 수정화면d으로 이동하기 위해 해당 노트의 id를 이용하여 가져오는 기능
class GetNoteUseCase {
  final NoteRepository repository;

  GetNoteUseCase(this.repository);

  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
