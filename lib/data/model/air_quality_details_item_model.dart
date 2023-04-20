import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_check/data/model/air_quality_details_item_components_model.dart';
part 'air_quality_details_item_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class AirQualityDetailsItemModel extends Equatable {
  final Map<String, dynamic> main;
  final AirQualityDetailsItemComponentsModel components;

  @override
  List<Object?> get props => [
        main,
        components,
      ];

  const AirQualityDetailsItemModel({
    required this.main,
    required this.components,
  });

  factory AirQualityDetailsItemModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDetailsItemModelFromJson(json);
}
