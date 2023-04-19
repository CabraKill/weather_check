// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityModel _$AirQualityModelFromJson(Map<String, dynamic> json) =>
    AirQualityModel(
      details: (json['list'] as List<dynamic>)
          .map((e) =>
              AirQualityDetailsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirQualityModelToJson(AirQualityModel instance) =>
    <String, dynamic>{
      'list': instance.details,
    };
