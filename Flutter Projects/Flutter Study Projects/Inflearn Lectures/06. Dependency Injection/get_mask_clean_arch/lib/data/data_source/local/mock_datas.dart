import 'package:get_mask_clean_arch/domain/model/location.dart';
import 'package:get_mask_clean_arch/domain/model/permission.dart';
import 'package:get_mask_clean_arch/domain/model/store.dart';
import 'package:get_mask_clean_arch/domain/permission/location_permission_handler.dart';
import 'package:get_mask_clean_arch/domain/repository/location_repository.dart';
import 'package:get_mask_clean_arch/domain/repository/store_repository.dart';
import 'package:injectable/injectable.dart';

// store mock data
@dev
@Singleton(as: StoreRepository)
class MockStoreRepositoryImpl implements StoreRepository {
  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const Store(
        name: '자곡약국',
        address: 'address',
        lat: 1,
        lng: 1,
        remainStatus: 'remainStatus',
      ),
      const Store(
        name: '수서약국',
        address: 'address',
        lat: 3,
        lng: 3,
        remainStatus: 'remainStatus',
      ),
      const Store(
        name: '세곡약국',
        address: 'address',
        lat: 2,
        lng: 2,
        remainStatus: 'remainStatus',
      ),
    ];
  }
}

// 현재 위치 mock data
@dev
@Singleton(as: LocationRepository)
class MockLocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    return Location(0, 0);
  }
}

// 권한 mock data
@dev
@Singleton(as: LocationPermissionHandler)
class MockLocationPermissionHandler implements LocationPermissionHandler {
  @override
  Future<Permission> checkPermission() async {
    return Permission.always;
  }

  @override
  Future<bool> isLocationServiceEnable() async {
    return true;
  }

  @override
  Future<Permission> requestPermission() async {
    return Permission.always;
  }
}
