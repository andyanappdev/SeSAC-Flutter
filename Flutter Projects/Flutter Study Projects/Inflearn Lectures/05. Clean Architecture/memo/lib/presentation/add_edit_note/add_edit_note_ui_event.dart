import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'add_edit_note_ui_event.freezed.dart';

@freezed
sealed class AddEditNoteUiEvent with _$AddEditNoteUiEvent {
  const factory AddEditNoteUiEvent.saveNoteTapped() = SaveNoteTapped;
  const factory AddEditNoteUiEvent.showSnackBar(String message) = ShowSnackBar;
}
