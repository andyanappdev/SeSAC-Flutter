import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memo_refactoring/presentation/notes/components/note_item.dart';
import 'package:memo_refactoring/presentation/notes/components/order_section.dart';
import 'package:memo_refactoring/presentation/notes/notes_event.dart';
import 'package:memo_refactoring/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewModel.titleRepository.getTitle(),
          style: const TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.onEvent(const NotesEvent.toggleOrderSection());
            },
            icon: const Icon(Icons.sort),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await context.push('/add_note');

          if (isSaved != null && isSaved == true) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isOrderSectionVisible
                  ? OrderSection(
                      noteOrder: state.noteOrder,
                      onOrderChanged: (noteOrder) {
                        viewModel.onEvent(NotesEvent.changeOrder(noteOrder));
                      },
                    )
                  : Container(),
            ),
            ...state.notes
                .map(
                  (note) => GestureDetector(
                    onTap: () async {
                      final uri = Uri(
                        path: '/edit_note',
                        queryParameters: {'note': jsonEncode(note.toJson())},
                      );

                      bool? isSaved = await context.push(uri.toString());

                      if (isSaved != null && isSaved == true) {
                        viewModel.onEvent(const NotesEvent.loadNotes());
                      }
                    },
                    child: NoteItem(
                      note: note,
                      deleteIconTapped: () {
                        viewModel.onEvent(NotesEvent.deleteNote(note));

                        final snackBar = SnackBar(
                          content: const Text('Completed deleting the memo'),
                          action: SnackBarAction(
                            label: 'Cancel',
                            onPressed: () {
                              viewModel.onEvent(const NotesEvent.restoreNote());
                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
