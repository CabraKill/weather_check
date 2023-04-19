import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_check/domain/entities/air_quality_entity.dart';
import 'package:weather_check/domain/entities/gas_area_item_entity.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/initial_home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loaded_home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loading_home_page_state.dart';
import 'package:weather_check/domain/entities/weather_entity.dart';
import 'package:weather_check/domain/usecase/get_weather_usecase.dart';
import 'package:weather_check/infra/constants/gas_type_enum.dart';

@injectable
class HomePageController extends Cubit<HomePageState> {
  //TODO put it inside the state
  bool showExpanded = false;
  final GetWeatherUsecase _getWeatherUsecase;

  HomePageController({
    required GetWeatherUsecase getWeatherUsecase,
  })  : _getWeatherUsecase = getWeatherUsecase,
        super(
          const InitialHomePageState(),
        );

  void onPressed() {
    _updateWeather();
  }

  List<GasAreaItemEntity> getGasAreaItemList(AirQualityEntity airQuality) {
    return [
      GasAreaItemEntity(value: airQuality.so2, type: GasType.so2),
      GasAreaItemEntity(value: airQuality.no2, type: GasType.no2),
      GasAreaItemEntity(value: airQuality.pm10, type: GasType.pm10),
      GasAreaItemEntity(value: airQuality.pm25, type: GasType.pm25),
      GasAreaItemEntity(value: airQuality.o3, type: GasType.o3),
      GasAreaItemEntity(value: airQuality.co, type: GasType.co),
    ];
  }

  void toggleVisibility() {
    _updateState(
      state.copyWith(
        locationVisible: !state.locationVisible,
      ),
    );
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
