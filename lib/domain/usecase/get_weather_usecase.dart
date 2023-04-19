import 'package:weather_check/domain/entities/usecase_response_entity.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';

abstract class GetWeatherUsecase {
  //TODO create a specify exception for this usecase
  Future<UseCaseResponseEntity<WeatherEntity, Exception>> call();
}
