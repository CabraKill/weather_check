import 'package:weather_check/domain/entities/location_entity.dart';

abstract class GetLocationRepository {
  Future<LocationEntity> call();
}