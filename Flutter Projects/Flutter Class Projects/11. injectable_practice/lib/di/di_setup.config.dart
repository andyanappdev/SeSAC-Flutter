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
import 'package:injectable_practice/data/counter.dart' as _i3;
import 'package:injectable_practice/data/counter_repository.dart' as _i4;
import 'package:injectable_practice/data/counter_repository_impl.dart' as _i5;
import 'package:injectable_practice/di/app_module.dart' as _i7;
import 'package:injectable_practice/ui/main/main_view_model.dart' as _i6;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final appDebugModule = _$AppDebugModule();
    gh.singleton<_i3.Counter>(_i3.Counter());
    gh.singleton<_i4.CounterRepository>(
      _i5.CounterRepositoryImpl(gh<_i3.Counter>()),
      registerFor: {_prod},
    );
    gh.factory<_i4.CounterRepository>(
      () => _i5.MockCounterRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i6.MainViewModel>(
        () => _i6.MainViewModel(gh<_i4.CounterRepository>()));
    gh.lazySingleton<String>(
      () => appModule.appTitle,
      registerFor: {_prod},
    );
    gh.lazySingleton<String>(
      () => appDebugModule.appTile,
      registerFor: {_dev},
    );
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}

class _$AppDebugModule extends _i7.AppDebugModule {}
