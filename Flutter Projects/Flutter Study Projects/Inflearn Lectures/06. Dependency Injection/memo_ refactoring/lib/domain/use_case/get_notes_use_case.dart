import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/domain/repository/note_repository.dart';
import 'package:memo_refactoring/domain/util/note_order.dart';
import 'package:memo_refactoring/domain/util/order_type.dart';

// notes screen에 모든 노트를 가져오는 기능
class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();
    switch (noteOrder) {
      case NoteOrderTitle(:final orderType):
        switch (orderType) {
          case Ascending():
            notes.sort((a, b) => a.title.compareTo(b.title));
          case Descending():
            notes.sort((a, b) => -a.title.compareTo(b.title));
        }
      case NoteOrderdate(:final orderType):
        switch (orderType) {
          case Ascending():
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          case Descending():
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
        }
      case NoteOrderColor(:final orderType):
        switch (orderType) {
          case Ascending():
            notes.sort((a, b) => a.color.compareTo(b.color));
          case Descending():
            notes.sort((a, b) => -a.color.compareTo(b.color));
        }
    }

    return notes;
  }
}
