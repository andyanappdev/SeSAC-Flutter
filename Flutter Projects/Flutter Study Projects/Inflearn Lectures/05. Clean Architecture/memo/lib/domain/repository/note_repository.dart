import 'package:memo/domain/model/note.dart';

// 추상화 repository interface 정의
abstract interface class NoteRepository {
  // note들을 가져오는 메서드
  Future<List<Note>> getNotes();

  // note의 id를 가지고 해당 노트만 가져오는 메서드
  Future<Note> getNoteById(int id);

  // note 생성
  Future<void> createNote(Note note);

  // note 업데이트
  Future<void> updateNote(Note note);

  // note 삭제
  Future<void> deleteNote(Note note);
}
