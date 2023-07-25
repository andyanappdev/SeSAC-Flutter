import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/domain/repository/title_repository.dart';
import 'package:memo_refactoring/domain/use_case/use_cases.dart';
import 'package:memo_refactoring/domain/util/note_order.dart';
import 'package:memo_refactoring/domain/util/order_type.dart';
import 'package:memo_refactoring/presentation/notes/notes_event.dart';
import 'package:memo_refactoring/presentation/notes/notes_state.dart';

@injectable
class NotesViewModel with ChangeNotifier {
  final UseCases useCases;
  final TitleRepository titleRepository;

  NotesState _state = const NotesState(
    noteOrder: NoteOrder.date(OrderType.descending()),
  );

  // getter
  NotesState get state => _state;

  // 삭제한 노트를 임시로 담아둘 글로벌 변수
  Note? _recentlyDeletedNote;

  NotesViewModel(this.useCases, this.titleRepository) {
    _loadNotes();
  }

  // notes screen에서 필요한 기능
  // 1. 노트 생성, 2. 노트 삭제, 3. 삭제된 노트 restore
  void onEvent(NotesEvent event) {
    switch (event) {
      case LoadNotes():
        _loadNotes();
      case DeleteNote(:final note):
        _deleteNote(note);
      case RestoreNote():
        _restoreNote();
      case ChangeOrder(:final noteOrder):
        _state = state.copyWith(
          noteOrder: noteOrder,
        );
        _loadNotes();
      case ToggleOrderSection():
        _state = state.copyWith(
          isOrderSectionVisible: !state.isOrderSectionVisible,
        );
        notifyListeners();
    }
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotesUseCase.call(state.noteOrder);
    _state = _state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNoteUseCase.call(note); // 노트를 삭제
    _recentlyDeletedNote = note; // 삭제한 노트를 임시 글로벌 변수를 생성하여 담아두고
    await _loadNotes(); // 처리가된 노트들을 불러오기
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNoteUseCase.call(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      await _loadNotes(); // 처리 후 다시 노트 불러오기
    }
  }
}
