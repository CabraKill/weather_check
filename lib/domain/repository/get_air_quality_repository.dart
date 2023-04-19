import 'package:weather_check/domain/entities/air_quality_entity.dart';
import 'package:weather_check/domain/entities/location_entity.dart';

abstract class GetAirQualityRepository{
  Future<AirQualityEntity> call(LocationEntity location);
}