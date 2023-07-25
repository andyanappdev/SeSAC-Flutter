// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:memo_refactoring/data/data_source/local/note_db_helper.dart'
    as _i4;
import 'package:memo_refactoring/data/repository/mock_title_repository_impl.dart'
    as _i10;
import 'package:memo_refactoring/data/repository/note_repository_impl.dart'
    as _i7;
import 'package:memo_refactoring/data/repository/title_repository_impl.dart'
    as _i9;
import 'package:memo_refactoring/di/app_module.dart' as _i19;
import 'package:memo_refactoring/domain/repository/note_repository.dart' as _i6;
import 'package:memo_refactoring/domain/repository/title_repository.dart'
    as _i8;
import 'package:memo_refactoring/domain/use_case/add_note_use_case.dart'
    as _i13;
import 'package:memo_refactoring/domain/use_case/delete_note_use_case.dart'
    as _i14;
import 'package:memo_refactoring/domain/use_case/get_note_use_case.dart'
    as _i15;
import 'package:memo_refactoring/domain/use_case/get_notes_use_case.dart'
    as _i16;
import 'package:memo_refactoring/domain/use_case/update_note_use_case.dart'
    as _i11;
import 'package:memo_refactoring/domain/use_case/use_cases.dart' as _i17;
import 'package:memo_refactoring/presentation/add_edit_note/add_edit_note_view_model.dart'
    as _i12;
import 'package:memo_refactoring/presentation/notes/notes_view_model.dart'
    as _i18;
import 'package:sqflite/sqflite.dart' as _i3;
import 'package:sqflite/sqlite_api.dart' as _i5;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.Database>(
      () => appModule.db,
      preResolve: true,
    );
    gh.singleton<_i4.NoteDbHelper>(_i4.NoteDbHelper(gh<_i5.Database>()));
    gh.singleton<_i6.NoteRepository>(
        _i7.NoteRepositoryImpl(gh<_i4.NoteDbHelper>()));
    gh.singleton<_i8.TitleRepository>(
      _i9.TitleRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i8.TitleRepository>(
      _i10.MockTitleRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i11.UpdateNoteUseCase>(
        _i11.UpdateNoteUseCase(gh<_i6.NoteRepository>()));
    gh.factory<_i12.AddEditNoteViewModel>(
        () => _i12.AddEditNoteViewModel(gh<_i6.NoteRepository>()));
    gh.singleton<_i13.AddNoteUseCase>(
        _i13.AddNoteUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i14.DeleteNoteUseCase>(
        _i14.DeleteNoteUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i15.GetNoteUseCase>(
        _i15.GetNoteUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i16.GetNotesUseCase>(
        _i16.GetNotesUseCase(gh<_i6.NoteRepository>()));
    gh.singleton<_i17.UseCases>(_i17.UseCases(
      addNoteUseCase: gh<_i13.AddNoteUseCase>(),
      deleteNoteUseCase: gh<_i14.DeleteNoteUseCase>(),
      getNoteUseCase: gh<_i15.GetNoteUseCase>(),
      getNotesUseCase: gh<_i16.GetNotesUseCase>(),
      updateNoteUseCase: gh<_i11.UpdateNoteUseCase>(),
    ));
    gh.factory<_i18.NotesViewModel>(() => _i18.NotesViewModel(
          gh<_i17.UseCases>(),
          gh<_i8.TitleRepository>(),
        ));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
