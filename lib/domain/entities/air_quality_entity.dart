import 'package:equatable/equatable.dart';

class AirQualityEntity extends Equatable {
  final double so2;
  final double no2;
  final double pm10;
  final double pm25;
  final double o3;
  final double co;
  final double nh3;
  final double no;

  @override
  List<Object?> get props => [
        so2,
        no2,
        pm10,
        pm25,
        o3,
        co,
        nh3,
        no,
      ];

  const AirQualityEntity({
    required this.so2,
    required this.no2,
    required this.pm10,
    required this.pm25,
    required this.o3,
    required this.co,
    required this.nh3,
    required this.no,
  });
}
