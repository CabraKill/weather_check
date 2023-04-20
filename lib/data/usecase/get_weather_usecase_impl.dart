import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/domain/entities/usecase_response_entity.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';
import 'package:weather_check/domain/repository/get_air_quality_repository.dart';
import 'package:weather_check/domain/repository/get_location_repository.dart';
import 'package:weather_check/domain/repository/get_weather_status_repository.dart';
import 'package:weather_check/domain/usecase/get_weather_usecase.dart';

@Injectable(as: GetWeatherUsecase)
class GetWeatherUsecaseImpl implements GetWeatherUsecase {
  final GetLocationRepository _getLocationRepository;
  final GetAirQualityRepository _getAirQualityRepository;
  final GetWeatherStatusRepository _getWeatherStatusRepository;

  const GetWeatherUsecaseImpl({
    required GetLocationRepository getLocationRepository,
    required GetAirQualityRepository getAirQualityRepository,
    required GetWeatherStatusRepository getWeatherStatusRepository,
  })  : _getLocationRepository = getLocationRepository,
        _getAirQualityRepository = getAirQualityRepository,
        _getWeatherStatusRepository = getWeatherStatusRepository;

  @override
  Future<UseCaseResponseEntity<WeatherEntity, Exception>> call() async {
    try {
      final location = await _getLocationRepository();
      final airQuality = await _getAirQualityRepository(location);
      final weatherStatus = await _getWeatherStatusRepository(location);

      return UseCaseResponseEntity.success(
        WeatherEntity(
          airQuality: airQuality,
          location: location,
          weatherStatus: weatherStatus,
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
}
