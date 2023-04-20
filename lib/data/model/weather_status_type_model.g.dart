// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_status_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherStatusTypeModel _$WeatherStatusTypeModelFromJson(
        Map<String, dynamic> json) =>
    WeatherStatusTypeModel(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$WeatherStatusTypeModelToJson(
        WeatherStatusTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
    };
