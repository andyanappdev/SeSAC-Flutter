import 'package:memo/domain/model/note.dart';
import 'package:memo/domain/repository/note_repository.dart';
import 'package:memo/domain/use_case/get_notes_use_case.dart';
import 'package:memo/domain/util/note_order.dart';
import 'package:memo/domain/util/order_type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('정렬 기능 작동 확인', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);

    // 동작 정의
    when(repository.getNotes()).thenAnswer((_) async => [
          const Note(
              title: 'title', content: 'content', color: 1, timestamp: 1),
          const Note(
              title: 'title2', content: 'content2', color: 2, timestamp: 2),
        ]);

    List<Note> result =
        await getNotes(const NoteOrder.date(OrderType.descending()));
    expect(result, isA<List<Note>>());
    expect(result.first.timestamp, 2);
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 1);
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.title(OrderType.ascending()));
    expect(result.first.title, 'title');
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.title(OrderType.descending()));
    expect(result.first.title, 'title2');
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.color(OrderType.ascending()));
    expect(result.first.color, 1);
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.color(OrderType.descending()));
    expect(result.first.color, 2);
    verify(repository.getNotes());

    verifyNoMoreInteractions(repository);
  });
}
