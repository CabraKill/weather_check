// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherStatusModel _$WeatherStatusModelFromJson(Map<String, dynamic> json) =>
    WeatherStatusModel(
      weatherList: (json['weather'] as List<dynamic>)
          .map(
              (e) => WeatherStatusTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
