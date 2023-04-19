// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repository/get_air_quaility_repository_impl.dart' as _i4;
import '../../data/repository/get_location_repository_impl.dart' as _i6;
import '../../data/usecase/get_location_usecase_impl.dart' as _i8;
import '../../data/usecase/get_weather_usecase_impl.dart' as _i10;
import '../../domain/repository/get_air_quality_repository.dart' as _i3;
import '../../domain/repository/get_location_repository.dart' as _i5;
import '../../domain/usecase/get_location_usecase.dart' as _i7;
import '../../domain/usecase/get_weather_usecase.dart' as _i9;
import '../../presentation/pages/homePage/home_page_controller.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetAirQualityRepository>(
        () => _i4.GetAirQualityRepositoryImpl());
    gh.factory<_i5.GetLocationRepository>(
        () => _i6.GetLocationRepositoryImpl());
    gh.factory<_i7.GetLocationUsecase>(() => _i8.GetLocationUsecaseImpl());
    gh.factory<_i9.GetWeatherUsecase>(() => _i10.GetWeatherUsecaseImpl(
          getLocationRepository: gh<_i5.GetLocationRepository>(),
          getAirQualityRepository: gh<_i3.GetAirQualityRepository>(),
        ));
    gh.factory<_i11.HomePageController>(() => _i11.HomePageController(
        getWeatherUsecase: gh<_i9.GetWeatherUsecase>()));
    return this;
  }
}
