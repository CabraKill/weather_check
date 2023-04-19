import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/repository/get_location_repository.dart';

@Injectable(as: GetLocationRepository)
class GetLocationRepositoryImpl implements GetLocationRepository {
  @override
  Future<LocationEntity> call() async {
    //Bangladesh
    // return LocationEntity(
    //   latitude: 23.777176,
    //   longitude: 90.399452,
    // );
    //italy
    // return LocationEntity(
    //   latitude: 41.87194,
    //   longitude: 12.56738,
    // );
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final result = await Geolocator.getCurrentPosition();

    return LocationEntity(
      latitude: result.latitude,
      longitude: result.longitude,
    );
  }
}
