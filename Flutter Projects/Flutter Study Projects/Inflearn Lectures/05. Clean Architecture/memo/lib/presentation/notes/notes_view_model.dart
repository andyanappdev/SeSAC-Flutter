import 'package:flutter/material.dart';
import 'package:memo/domain/repository/note_repository.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesViewModel(this.repository);

  // notes screen에서 필요한 기능
  // 1. 노트 생성, 2. 노트 삭제, 3. 삭제된 노트 undo
}
