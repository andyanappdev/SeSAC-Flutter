import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

class UpdateNote {
  NoteRepository repository;

  UpdateNote(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}
