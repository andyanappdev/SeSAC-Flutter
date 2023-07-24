import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:memo_refactoring/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:memo_refactoring/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:memo_refactoring/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  StreamSubscription? _streamSubscription; //
  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();
      /* listen
      StreamSubscription<AddEditNoteUiEvent> listen(
        void Function(AddEditNoteUiEvent)? onData, {
        Function? onError,
        void Function()? onDone,
        bool? cancelOnError, })
      Containing class: Stream

      listen은 화면이 사라져도 계속해서 listen 하고 있기 때문에 StreamSubscription을 화면이 사라질때 해제가 필요하다
      */
      _streamSubscription = viewModel.eventStream.listen((event) {
        switch (event) {
          case SaveNoteTapped():
            Navigator.pop(context, true);
          case ShowSnackBar(:final String message):
            final snackBar = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(AddEditNoteEvent.saveNote(
            widget.note == null ? null : widget.note!.id,
            _titleController.text,
            _contentController.text,
          ));
        },
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
        color: Color(viewModel.color),
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map(
                    (color) => InkWell(
                      //제스처디텍터와 같은 역할, 단 에니메이션 효과있음
                      onTap: () {
                        viewModel
                            .onEvent(AddEditNoteEvent.changeColor(color.value));
                      },
                      child: _buildBackgroundColor(
                        color: color,
                        selected: viewModel.color == color.value,
                      ),
                    ),
                  )
                  .toList(),
            ),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: darkGray),
              decoration: const InputDecoration(
                hintText: 'Type in Title',
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: darkGray),
              decoration: const InputDecoration(
                hintText: 'Type in Content',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({required Color color, required bool selected}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          )
        ],
        border: selected
            ? Border.all(
                color: Colors.black,
                width: 2.0,
              )
            : null,
      ),
    );
  }
}
