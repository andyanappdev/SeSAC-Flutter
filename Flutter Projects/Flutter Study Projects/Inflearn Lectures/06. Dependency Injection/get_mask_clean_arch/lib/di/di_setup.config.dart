// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_mask_clean_arch/data/mock_datas.dart' as _i4;
import 'package:get_mask_clean_arch/domain/permission/location_permission_handler.dart'
    as _i3;
import 'package:get_mask_clean_arch/domain/repository/location_repository.dart'
    as _i5;
import 'package:get_mask_clean_arch/domain/repository/store_repository.dart'
    as _i6;
import 'package:get_mask_clean_arch/domain/use_case/get_near_by_stores_use_case.dart'
    as _i7;
import 'package:get_mask_clean_arch/presentation/main/main_view_model.dart'
    as _i8;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.singleton<_i3.LocationPermissionHandler>(
      _i4.MockLocationPermissionHandler(),
      registerFor: {_dev},
    );
    gh.singleton<_i5.LocationRepository>(
      _i4.MockLocationRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i6.StoreRepository>(
      _i4.MockStoreRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i7.GetNearByStoresUseCase>(_i7.GetNearByStoresUseCase(
      storeRepository: gh<_i6.StoreRepository>(),
      locationRepository: gh<_i5.LocationRepository>(),
      locationPermissionHandler: gh<_i3.LocationPermissionHandler>(),
    ));
    gh.factory<_i8.MainViewModel>(
        () => _i8.MainViewModel(gh<_i7.GetNearByStoresUseCase>()));
    return this;
  }
}
