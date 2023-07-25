import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/domain/repository/note_repository.dart';
import 'package:memo_refactoring/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:memo_refactoring/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:memo_refactoring/presentation/notes/notes_screen.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/notes',
  routes: [
    GoRoute(
      path: '/notes',
      builder: (context, state) => const NotesScreen(),
    ),
    GoRoute(
      path: '/add_note',
      builder: (context, state) {
        final repository = context.read<NoteRepository>();
        final viewModel = AddEditNoteViewModel(repository);
        return ChangeNotifierProvider(
          create: (_) => viewModel,
          child: const AddEditNoteScreen(),
        );
      },
    ),
    GoRoute(
      path: '/edit_note',
      builder: (context, state) {
        final Note note =
            Note.fromJson(jsonDecode(state.queryParameters['note']!));

        final repository = context.read<NoteRepository>();
        final viewModel = AddEditNoteViewModel(repository);
        return ChangeNotifierProvider(
          create: (_) => viewModel,
          child: AddEditNoteScreen(note: note),
        );
      },
    ),
  ],
);
