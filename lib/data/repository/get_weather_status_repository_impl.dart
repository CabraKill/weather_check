import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/data/model/weather_status_model.dart';
import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/entities/weather_status_entity.dart';
import 'package:weather_check/domain/repository/get_weather_status_repository.dart';
import 'package:weather_check/infra/constants/air_api_constants.dart';

@Injectable(as: GetWeatherStatusRepository)
class GetWeatherStatusRepositoryImpl implements GetWeatherStatusRepository {
  // final WeatherStatusRemoteDataSource remoteDataSource;
  // final WeatherStatusLocalDataSource localDataSource;

  static const _airApiKey = String.fromEnvironment('AIR_API_KEY');
  static const _apiUrl = AirApiConstants.weather;
  static const _okStatusCode = 200;

  @override
  Future<WeatherStatusEntity> call(LocationEntity location) async {
    final getKeyFromFlutterEnv = _airApiKey;
    final path = _getPath(location, getKeyFromFlutterEnv);

    final response = await Dio().get(path);
    if (response.statusCode != _okStatusCode) {
      throw Exception('Error getting air quality');
    }
    final data = response.data;
    final airQuality = WeatherStatusModel.fromJson(data);

    return airQuality.toEntity();
  }

  String _getPath(LocationEntity location, String apiKey) {
    final lat = location.latitude;
    final long = location.longitude;

    return "$_apiUrl?lat=$lat&lon=$long&appid=$apiKey";
  }
}
