import 'package:equatable/equatable.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';

class LoadedHomePageState extends Equatable implements HomePageState {
  final WeatherEntity weather;

  @override
  List<Object> get props => [
        weather,
      ];

  const LoadedHomePageState({
    required this.weather,
  });
}
