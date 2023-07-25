import 'package:injectable/injectable.dart';
import 'package:memo_refactoring/data/data_source/local/note_db_helper.dart';
import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/domain/repository/note_repository.dart';

@Singleton(as: NoteRepository)
class NoteRepositoryImpl implements NoteRepository {
  final NoteDbHelper db;

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
