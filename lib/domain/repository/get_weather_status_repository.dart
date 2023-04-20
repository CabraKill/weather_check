import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/entities/weather_status_entity.dart';

abstract class GetWeatherStatusRepository {
  Future<WeatherStatusEntity> call(LocationEntity location);
}
