import 'package:weather_check/infra/constants/gas_type_enum.dart';

class GasAreaItemEntity {
  final double value;
  final GasType type;

  const GasAreaItemEntity({
    required this.value,
    required this.type,
  });
}
