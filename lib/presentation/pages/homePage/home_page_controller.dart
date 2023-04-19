import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/initial_home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loaded_home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loading_home_page_state.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';
import 'package:weather_check/domain/usecase/get_weather_usecase.dart';

@injectable
class HomePageController extends Cubit<HomePageState> {
  final GetWeatherUsecase _getWeatherUsecase;

  bool showExpanded = false;

  HomePageController({
    required GetWeatherUsecase getWeatherUsecase,
  })  : _getWeatherUsecase = getWeatherUsecase,
        super(
          const InitialHomePageState(),
        );

  void onPressed() {
    _updateWeather();
  }

  Future<void> _updateWeather() async {
    _updateState(const LoadingHomePageState());
    final result = await _getWeatherUsecase();
    result.when(
      success: _onLoadLocationSuccess,
      error: (exception) {
        //TODO handle error
      },
    );
  }

  void _onLoadLocationSuccess(WeatherEntity weather) {
    showExpanded = true;
    _updateState(
      LoadedHomePageState(
        weather: weather,
      ),
    );
  }

  void _updateState(HomePageState newState) {
    emit(newState);
  }
}
