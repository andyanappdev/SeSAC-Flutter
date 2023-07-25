import 'package:injectable/injectable.dart';
import 'package:memo_refactoring/domain/model/note.dart';
import 'package:memo_refactoring/domain/repository/note_repository.dart';

// + 버튼이 눌렸을때 새로운 노트 생성화면으로 이동하여 내용이 입력된 후 노트가 생성되는 기능
@singleton
class AddNoteUseCase {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    repository.insertNote(note);
  }
}
