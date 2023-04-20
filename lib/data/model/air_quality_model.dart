import 'package:equatable/equatable.dart';
import 'package:weather_check/data/model/air_quality_details_item_model.dart';
import 'package:weather_check/domain/entities/air_quality_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'air_quality_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class AirQualityModel extends Equatable {
  @JsonKey(name: "list")
  final List<AirQualityDetailsItemModel> details;

  @override
  List<Object?> get props => [
        details,
      ];

  const AirQualityModel({
    required this.details,
  });

  factory AirQualityModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityModelFromJson(json);

  AirQualityEntity toEntity() {
    final mainResult = details.first;

    return AirQualityEntity(
      so2: mainResult.components.so2,
      no2: mainResult.components.no2,
      pm10: mainResult.components.pm10,
      pm25: mainResult.components.pm2_5,
      o3: mainResult.components.o3,
      co: mainResult.components.co,
      nh3: mainResult.components.nh3,
      no: mainResult.components.no,
    );
  }
}
