import 'package:get_mask_clean_arch/domain/model/location.dart';
import 'package:get_mask_clean_arch/domain/model/permission.dart';
import 'package:get_mask_clean_arch/domain/model/store.dart';
import 'package:get_mask_clean_arch/domain/permission/location_permission_handler.dart';
import 'package:get_mask_clean_arch/domain/repository/location_repository.dart';
import 'package:get_mask_clean_arch/domain/repository/store_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetNearByStoresUseCase {
  final StoreRepository _storeRepository;
  final LocationRepository _locationRepository;
  final LocationPermissionHandler _locationPermissionHandler;

  GetNearByStoresUseCase({
    required StoreRepository storeRepository,
    required LocationRepository locationRepository,
    required LocationPermissionHandler locationPermissionHandler,
  })  : _locationPermissionHandler = locationPermissionHandler,
        _locationRepository = locationRepository,
        _storeRepository = storeRepository;

  Future<List<Store>> execute() async {
    final stores = await _storeRepository.getStores();

    // 기기의 위치 서비스 확인
    final isServiceEnable =
        await _locationPermissionHandler.isLocationServiceEnable();
    // 권한 확인
    if (isServiceEnable == true) {
      // 현재 위치 권한 정보를 체크
      var permission = await _locationPermissionHandler.checkPermission();
      //// 거부 -> 정렬 없이 리턴
      if (permission == Permission.denied) {
        // 권한 요청
        permission = await _locationPermissionHandler.requestPermission();

        // 위에서 권한 요청한 것에 대해 다시한번더 확인
        if (permission == Permission.denied) {
          print('거부');
          return stores;
        }
      }
      //// 2번 거부 -> 정렬 없이 리턴
      if (permission == Permission.deniedForever) {
        print('2번 거부한 상태');
        return stores;
      }
      //// 승인 -> 정렬 해서 리턴
      final location = await _locationRepository.getLocation();
      return stores.map((store) {
        return store.copyWith(
            distance: location.distanceBetween(Location(store.lat, store.lng)));
      }).toList()
        ..sort((a, b) => a.distance.compareTo(b.distance));
    }

    return stores;
  }
}
