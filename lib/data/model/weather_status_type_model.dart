import 'package:json_annotation/json_annotation.dart';
import 'package:weather_check/domain/entities/weather_status_entity.dart';
import 'package:weather_check/infra/constants/weather_type_enum.dart';
part 'weather_status_type_model.g.dart';

@JsonSerializable()
class WeatherStatusTypeModel {
  final int id;
  final String main;
  final String description;

  WeatherStatusTypeModel({
    required this.id,
    required this.main,
    required this.description,
  });

  factory WeatherStatusTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherStatusTypeModelFromJson(json);

  WeatherStatusEntity toEntity() {
    return WeatherStatusEntity(
      id: id,
      name: main,
      description: description,
      type: WeatherType.thunderstorm,
    );
  }
}
