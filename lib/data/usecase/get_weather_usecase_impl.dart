import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/domain/entities/usecase_response_entity.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';
import 'package:weather_check/domain/repository/get_air_quality_repository.dart';
import 'package:weather_check/domain/repository/get_location_repository.dart';
import 'package:weather_check/domain/usecase/get_weather_usecase.dart';

@Injectable(as: GetWeatherUsecase)
class GetWeatherUsecaseImpl implements GetWeatherUsecase {
  final GetLocationRepository _getLocationRepository;
  final GetAirQualityRepository _getAirQualityRepository;

  const GetWeatherUsecaseImpl({
    required GetLocationRepository getLocationRepository,
    required GetAirQualityRepository getAirQualityRepository,
  })  : _getLocationRepository = getLocationRepository,
        _getAirQualityRepository = getAirQualityRepository;

  @override
  Future<UseCaseResponseEntity<WeatherEntity, Exception>> call() async {
    try {
      final location = await _getLocationRepository();
      final airQuality = await _getAirQualityRepository(location);

      return UseCaseResponseEntity.success(
        WeatherEntity(
          airQuality: airQuality,
          location: location,
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
