import 'package:weather_check/domain/entities/air_quality_entity.dart';
import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/entities/weather_status_entity.dart';

class WeatherEntity {
  final LocationEntity location;
  final AirQualityEntity airQuality;
  final WeatherStatusEntity weatherStatus;

  const WeatherEntity({
    required this.location,
    required this.airQuality,
    required this.weatherStatus,
  });
}
