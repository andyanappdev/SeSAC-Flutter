// import 'package:memo_refactoring/data/data_source/local/note_db_helper.dart';
// import 'package:memo_refactoring/data/repository/note_repository_impl.dart';
// import 'package:memo_refactoring/domain/repository/note_repository.dart';
// import 'package:memo_refactoring/domain/use_case/add_note_use_case.dart';
// import 'package:memo_refactoring/domain/use_case/delete_note_use_case.dart';
// import 'package:memo_refactoring/domain/use_case/get_note_use_case.dart';
// import 'package:memo_refactoring/domain/use_case/get_notes_use_case.dart';
// import 'package:memo_refactoring/domain/use_case/update_note_use_case.dart';
// import 'package:memo_refactoring/domain/use_case/use_cases.dart';
// import 'package:memo_refactoring/presentation/notes/notes_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';
// import 'package:sqflite/sqflite.dart';
//
// Future<List<SingleChildWidget>> getProviders() async {
//   Database database = await openDatabase(
//     'notes_db',
//     version: 1,
//     onCreate: (db, version) async {
//       await db.execute(
//           'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
//     },
//   );
//
//   NoteDbHelper noteDbHelper = NoteDbHelper(database);
//   NoteRepository noteRepository = NoteRepositoryImpl(noteDbHelper);
//   UseCases useCases = UseCases(
//     addNoteUseCase: AddNoteUseCase(noteRepository),
//     deleteNoteUseCase: DeleteNoteUseCase(noteRepository),
//     getNoteUseCase: GetNoteUseCase(noteRepository),
//     getNotesUseCase: GetNotesUseCase(noteRepository),
//     updateNoteUseCase: UpdateNoteUseCase(noteRepository),
//   );
//   NotesViewModel notesViewModel = NotesViewModel(useCases);
//
//   return [
//     ChangeNotifierProvider(create: (_) => notesViewModel),
//     Provider(create: (_) => noteRepository),
//   ];
// }
