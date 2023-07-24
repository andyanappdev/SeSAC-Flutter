import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

// 삭제 버튼이 눌렸을때 노트를 삭제하는 기능
class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    repository.deleteNote(note);
  }
}
