import 'package:equatable/equatable.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';

class LoadedHomePageState extends Equatable implements HomePageState {
  final WeatherEntity weather;
  @override
  final bool locationVisible;

  @override
  List<Object> get props => [
        locationVisible,
        weather,
      ];

  const LoadedHomePageState({
    required this.weather,
    this.locationVisible = true,
  });

  @override
  LoadedHomePageState copyWith({
    bool? locationVisible,
  }) {
    return LoadedHomePageState(
      weather: weather,
      locationVisible: locationVisible ?? this.locationVisible,
    );
  }
}
