import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/domain/repository/note_repository.dart';

class UpdateNoteUseCase {
  NoteRepository repository;

  UpdateNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}
