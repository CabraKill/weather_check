// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_details_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityDetailsItemModel _$AirQualityDetailsItemModelFromJson(
        Map<String, dynamic> json) =>
    AirQualityDetailsItemModel(
      main: json['main'] as Map<String, dynamic>,
      components: AirQualityDetailsItemComponentsModel.fromJson(
          json['components'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirQualityDetailsItemModelToJson(
        AirQualityDetailsItemModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'components': instance.components,
    };
