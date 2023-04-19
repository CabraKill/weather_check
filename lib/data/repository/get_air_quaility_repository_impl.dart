import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/data/model/air_quality_model.dart';
import 'package:weather_check/domain/entities/air_quality_entity.dart';
import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/repository/get_air_quality_repository.dart';
import 'package:weather_check/infra/constants/air_api_constants.dart';

@Injectable(as: GetAirQualityRepository)
class GetAirQualityRepositoryImpl implements GetAirQualityRepository {
  static const _airApiKey = String.fromEnvironment('AIR_API_KEY');
  static const _apiUrl = AirApiConstants.url;
  static const _okStatusCode = 200;

  @override
  Future<AirQualityEntity> call(LocationEntity location) async {
    final getKeyFromFlutterEnv = _airApiKey;
    final path = _getPath(location, getKeyFromFlutterEnv);

    final response = await Dio().get(path);
    if (response.statusCode != _okStatusCode) {
      throw Exception('Error getting air quality');
    }
    final data = response.data;
    final airQuality = AirQualityModel.fromJson(data);

    return airQuality.toEntity();
  }

  String _getPath(LocationEntity location, String apiKey) {
    final lat = location.latitude;
    final long = location.longitude;

    return "$_apiUrl?lat=$lat&lon=$long&appid=$apiKey";
  }
}
