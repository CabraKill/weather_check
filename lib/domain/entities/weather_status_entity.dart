import 'package:equatable/equatable.dart';
import 'package:weather_check/infra/constants/weather_type_enum.dart';

class WeatherStatusEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final WeatherType type;
  final String iconUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        type,
        iconUrl,
      ];

  const WeatherStatusEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.iconUrl,
  });
}
