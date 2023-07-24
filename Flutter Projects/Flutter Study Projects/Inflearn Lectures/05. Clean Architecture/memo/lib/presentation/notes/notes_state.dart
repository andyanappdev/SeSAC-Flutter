import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/util/note_order.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState({
    @Default([]) List<Note> notes,
    required NoteOrder noteOrder,
    @Default(false) bool isOrderSectionVisible,
  }) = _NotesState;
}
