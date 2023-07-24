import 'package:flutter/material.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/presentation/notes/components/note_item.dart';
import 'package:memo/presentation/notes/notes_view_model.dart';
import 'package:memo/ui/colors.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                title: 'title1',
                content: 'test1',
                color: wisteria.value,
                timestamp: 1,
              ),
            ),
            NoteItem(
              note: Note(
                title: 'title2',
                content: 'test2',
                color: skyBlue.value,
                timestamp: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
