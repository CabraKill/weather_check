import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:weather_check/domain/entities/usecase_response_entity.dart';
import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/usecase/get_location_usecase.dart';

@Injectable(as: GetLocationUsecase)
class GetLocationUsecaseImpl implements GetLocationUsecase {
  @override
  Future<UseCaseResponseEntity<LocationEntity, Exception>> call() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return UseCaseResponseEntity.error(
            Exception('Location permissions are denied'),
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return UseCaseResponseEntity.error(
          Exception(
              'Location permissions are permanently denied, we cannot request permissions.'),
        );
      }

      final result = await Geolocator.getCurrentPosition();

      return UseCaseResponseEntity.success(
        LocationEntity(
          latitude: result.latitude,
          longitude: result.longitude,
        ),
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());

      return UseCaseResponseEntity.error(
        Exception(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<UseCaseResponseEntity<LocationEntity, Exception>> old_call() async {
    final location = Location();

    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final requestServiceEnabled = await location.requestService();
      if (!requestServiceEnabled) {
        return UseCaseResponseEntity.error(
          Exception('Location service is disabled'),
        );
      }
    }

    final permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      final permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return UseCaseResponseEntity.error(
          Exception('Location permission is denied'),
        );
      }
    }

    final locationData = await location.getLocation();

    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    if (latitude == null || longitude == null) {
      return UseCaseResponseEntity.error(
        Exception('Location data is null'),
      );
    }

    return UseCaseResponseEntity.success(
      LocationEntity(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}
