import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

// notes screen에 모든 노트를 가져오는 기능
class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    return notes;
  }
}
