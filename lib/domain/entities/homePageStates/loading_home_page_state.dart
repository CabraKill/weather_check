import 'package:equatable/equatable.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';

class LoadingHomePageState extends Equatable implements HomePageState {
  @override
  final bool locationVisible;
  @override
  List<Object> get props => [
        locationVisible,
      ];

  const LoadingHomePageState({
    this.locationVisible = true,
  });

  @override
  LoadingHomePageState copyWith({
    bool? locationVisible,
  }) {
    return LoadingHomePageState(
      locationVisible: locationVisible ?? this.locationVisible,
    );
  }
}
