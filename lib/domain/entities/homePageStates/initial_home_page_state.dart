import 'package:equatable/equatable.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';

class InitialHomePageState extends Equatable implements HomePageState {
  @override
  final bool locationVisible;
  @override
  List<Object> get props => [
        locationVisible,
      ];

  const InitialHomePageState({
    this.locationVisible = true,
  });

  @override
  InitialHomePageState copyWith({
    bool? locationVisible,
  }) {
    return InitialHomePageState(
      locationVisible: locationVisible ?? this.locationVisible,
    );
  }
}
