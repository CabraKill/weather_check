import 'package:weather_check/domain/entities/gas_statistics_entity.dart';
import 'package:weather_check/infra/constants/gas_type_enum.dart';

class GasStatisticsConstants {
  static const so2 = GasStatisticsEntity(
    maxGood: 20,
    maxFair: 80,
    maxModerate: 250,
    maxPoor: 350,
  );

  static const no2 = GasStatisticsEntity(
    maxGood: 40,
    maxFair: 70,
    maxModerate: 150,
    maxPoor: 200,
  );

  static const pm10 = GasStatisticsEntity(
    maxGood: 20,
    maxFair: 50,
    maxModerate: 100,
    maxPoor: 200,
  );

  static const pm25 = GasStatisticsEntity(
    maxGood: 10,
    maxFair: 25,
    maxModerate: 50,
    maxPoor: 75,
  );

  static const o3 = GasStatisticsEntity(
    maxGood: 60,
    maxFair: 100,
    maxModerate: 140,
    maxPoor: 180,
  );

  static const co = GasStatisticsEntity(
    maxGood: 4400,
    maxFair: 9400,
    maxModerate: 12400,
    maxPoor: 15400,
  );

  const GasStatisticsConstants._();

  static GasStatisticsEntity getItFromType(GasType type) {
    switch (type) {
      case GasType.so2:
        return so2;
      case GasType.no2:
        return no2;
      case GasType.pm10:
        return pm10;
      case GasType.pm25:
        return pm25;
      case GasType.o3:
        return o3;
      case GasType.co:
        return co;
    }
  }
}
