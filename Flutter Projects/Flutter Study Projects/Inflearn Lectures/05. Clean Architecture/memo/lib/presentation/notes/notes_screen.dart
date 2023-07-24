import 'package:flutter/material.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:memo/presentation/notes/components/note_item.dart';
import 'package:memo/presentation/notes/notes_event.dart';
import 'package:memo/presentation/notes/notes_view_model.dart';
import 'package:memo/ui/colors.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your note',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );

          if (isSaved != null && isSaved == true) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: state.notes
              .map(
                (note) => NoteItem(
                  note: note,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
