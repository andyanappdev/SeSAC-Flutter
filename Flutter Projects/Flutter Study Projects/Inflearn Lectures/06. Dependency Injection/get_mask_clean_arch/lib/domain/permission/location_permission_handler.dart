import 'package:get_mask_clean_arch/domain/model/permission.dart';

abstract interface class LocationPermissionHandler {
  Future<bool> isLocationServiceEnable();

  Future<Permission> checkPermission();

  Future<Permission> requestPermission();
}
