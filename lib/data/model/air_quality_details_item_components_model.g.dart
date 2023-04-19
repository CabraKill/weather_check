// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_details_item_components_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityDetailsItemComponentsModel
    _$AirQualityDetailsItemComponentsModelFromJson(Map<String, dynamic> json) =>
        AirQualityDetailsItemComponentsModel(
          co: (json['co'] as num).toDouble(),
          no: (json['no'] as num).toDouble(),
          no2: (json['no2'] as num).toDouble(),
          o3: (json['o3'] as num).toDouble(),
          so2: (json['so2'] as num).toDouble(),
          pm2_5: (json['pm2_5'] as num).toDouble(),
          pm10: (json['pm10'] as num).toDouble(),
          nh3: (json['nh3'] as num).toDouble(),
        );

Map<String, dynamic> _$AirQualityDetailsItemComponentsModelToJson(
        AirQualityDetailsItemComponentsModel instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no': instance.no,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm2_5,
      'pm10': instance.pm10,
      'nh3': instance.nh3,
    };
