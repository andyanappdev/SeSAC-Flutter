import 'package:geolocator/geolocator.dart';
import 'package:get_mask_clean_arch/domain/model/location.dart';
import 'package:get_mask_clean_arch/domain/repository/location_repository.dart';
import 'package:injectable/injectable.dart';

@prod
@Singleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print('=======현재 위치=======');
    print(position.toString());

    return Location(position.latitude, position.longitude);
  }
}
