import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

class UpdateNoteUseCase {
  NoteRepository repository;

  UpdateNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}
