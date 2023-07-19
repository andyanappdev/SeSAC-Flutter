import 'package:memo/data/data_source/local/note_db.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> createNote(Note note) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNote(Note note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(int id) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
