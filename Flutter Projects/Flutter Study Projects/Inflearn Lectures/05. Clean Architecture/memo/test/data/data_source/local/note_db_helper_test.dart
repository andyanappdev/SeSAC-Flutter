import 'package:memo/data/data_source/local/note_db_helper.dart';
import 'package:memo/domain/model/note.dart';
import 'package:test/test.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('DB Test', () async {
    var db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    // 가상 메모리에 올리는 db 생성
    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDbHelper(db);
    // note 생성 test
    await noteDbHelper.insertNote(
        const Note(title: 'test', content: 'test', color: 1, timestamp: 1));
    // 검증, note가 1개 생성되어 있다.
    expect((await noteDbHelper.getNotes()).length, 1);

    // note id로 note를 가져오는 test
    Note note = (await noteDbHelper.getNoteById(1))!;
    expect(note.id, 1);

    // note update test
    await noteDbHelper.updateNote(note.copyWith(title: 'change'));
    note = (await noteDbHelper.getNoteById(1))!;
    expect(note.title, 'change');

    // note delete test
    await noteDbHelper.deleteNote(note);
    expect((await noteDbHelper.getNotes()).length, 0);

    await db.close(); // db 닫아주는 코드
  });
}
