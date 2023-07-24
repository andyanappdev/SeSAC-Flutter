import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';
import 'package:memo/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:memo/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:memo/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = roseBud.value;
  // getter
  int get color => _color;

  /*
  기본적으로 StreamController는 한번만 listen이 가능 하다.
  broadcast() 로 설정해주면 여러번 반복해서 listen이 가능해 진다. (A controller where stream can be listened to more than once.)
  */
  final StreamController<AddEditNoteUiEvent> _eventController =
      StreamController<AddEditNoteUiEvent>.broadcast();
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    switch (event) {
      case ChangeColor():
        _changeColor(event.color);
      case SaveNote():
        _saveNote(event.id, event.title, event.content);
    }
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (title.isEmpty || content.isEmpty) {
      _eventController.add(
          const AddEditNoteUiEvent.showSnackBar('Title or Content is Empty'));
      return;
    }
    if (id == null) {
      repository.insertNote(
        Note(
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().microsecondsSinceEpoch),
      );
    } else {
      await repository.updateNote(
        Note(
            id: id,
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().microsecondsSinceEpoch),
      );
    }

    _eventController.add(const AddEditNoteUiEvent.saveNoteTapped());
  }
}
