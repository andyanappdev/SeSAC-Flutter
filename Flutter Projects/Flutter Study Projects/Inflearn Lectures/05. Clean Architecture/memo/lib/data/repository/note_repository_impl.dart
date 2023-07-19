import 'package:memo/data/data_source/local/note_db.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
