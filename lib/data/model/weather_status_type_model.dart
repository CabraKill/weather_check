import 'package:json_annotation/json_annotation.dart';
part 'weather_status_type_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class WeatherStatusTypeModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherStatusTypeModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherStatusTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherStatusTypeModelFromJson(json);
}
