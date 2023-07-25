import 'package:get_mask_clean_arch/domain/model/location.dart';

abstract interface class LocationRepository {
  Future<Location> getLocation();
}
