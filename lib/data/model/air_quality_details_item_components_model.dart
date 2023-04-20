import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'air_quality_details_item_components_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class AirQualityDetailsItemComponentsModel extends Equatable {
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;

  @override
  List<Object?> get props => [
        co,
        no,
        no2,
        o3,
        so2,
        pm2_5,
        pm10,
        nh3,
      ];

  const AirQualityDetailsItemComponentsModel({
    required this.co,
    required this.no,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.nh3,
  });

  factory AirQualityDetailsItemComponentsModel.fromJson(
          Map<String, dynamic> json) =>
      _$AirQualityDetailsItemComponentsModelFromJson(json);
}
