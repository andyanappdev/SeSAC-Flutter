import 'package:flutter/material.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';
import 'package:memo/presentation/notes/notes_event.dart';
import 'package:memo/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesState _state = NotesState();
  // getter
  NotesState get state => _state;

  // 삭제한 노트를 임시로 담아둘 글로벌 변수
  Note? _recentlyDeletedNote;

  NotesViewModel(this.repository);

  // notes screen에서 필요한 기능
  // 1. 노트 생성, 2. 노트 삭제, 3. 삭제된 노트 restore
  void onEvent(NotesEvent event) {
    switch (event) {
      case LoadNotes():
        _loadNotes();
      case DeleteNote():
        _deleteNote(_recentlyDeletedNote!); // 확인 필요 !!!
      case RestoreNote():
        _restoreNote();
    }
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = _state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note); // 노트를 삭제
    _recentlyDeletedNote = note; // 삭제한 노트를 임시 글로벌 변수를 생성하여 담아두고
    await _loadNotes(); // 처리가된 노트들을 불러오기
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      await _loadNotes(); // 처리 후 다시 노트 불러오기
    }
  }
}
