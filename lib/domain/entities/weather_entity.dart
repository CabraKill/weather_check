import 'package:weather_check/domain/entities/air_quality_entity.dart';
import 'package:weather_check/domain/entities/location_entity.dart';

class WeatherEntity {
  // final WeatherEnum weatherType;
  final AirQualityEntity airQuality;
  final LocationEntity location;

  const WeatherEntity({
    // required this.weatherType,
    required this.airQuality,
    required this.location,
  });
}
