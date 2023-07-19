import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

// notes screen에 모든 노트를 가져오는 기능
class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    return notes;
  }
}
