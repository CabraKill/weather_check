// ignore_for_file: no-magic-number
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_check/data/model/weather_status_type_model.dart';
import 'package:weather_check/domain/entities/weather_status_entity.dart';
import 'package:weather_check/infra/constants/weather_type_enum.dart';
part 'weather_status_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class WeatherStatusModel extends Equatable implements WeatherStatusEntity {
  @JsonKey(name: 'weather')
  final List<WeatherStatusTypeModel> weatherList;

  final String icon;

  @override
  final int id;

  @override
  final String name;
  @override
  final String description;

  @override
  final WeatherType type;

  @override
  String get iconUrl => 'http://openweathermap.org/img/wn/$icon.png';

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        type,
        iconUrl,
      ];

  WeatherStatusModel({
    required this.weatherList,
  })  : id = _getId(weatherList),
        name = _getName(weatherList),
        description = _getDescription(weatherList),
        type = getWeatherTypeFromId(weatherList.first.id),
        icon = weatherList.first.icon;

  factory WeatherStatusModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherStatusModelFromJson(json);

  WeatherStatusEntity toEntity() {
    return WeatherStatusEntity(
      id: id,
      name: name,
      description: description,
      type: type,
      iconUrl: iconUrl,
    );
  }

  static WeatherType getWeatherTypeFromId(int id) {
    if (id >= 200 && id <= 232) {
      return WeatherType.thunderstorm;
    } else if (id >= 300 && id <= 321) {
      return WeatherType.drizzle;
    } else if (id >= 500 && id <= 531) {
      return WeatherType.rain;
    } else if (id >= 600 && id <= 622) {
      return WeatherType.snow;
    } else if (id >= 701 && id <= 781) {
      return WeatherType.atmosphere;
    } else if (id == 800) {
      return WeatherType.clear;
    } else if (id >= 801 && id <= 804) {
      return WeatherType.clouds;
    } else {
      throw Exception('Unknown weather type');
    }
  }

  static String _getDescription(List<WeatherStatusTypeModel> weatherList) =>
      weatherList.first.description;

  static String _getName(List<WeatherStatusTypeModel> weatherList) =>
      weatherList.first.main;

  static int _getId(List<WeatherStatusTypeModel> weatherList) =>
      weatherList.first.id;
}
