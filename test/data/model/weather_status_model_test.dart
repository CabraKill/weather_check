// ignore_for_file: no-magic-number
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_check/data/model/weather_status_model.dart';
import 'package:weather_check/data/model/weather_status_type_model.dart';
import 'package:weather_check/domain/entities/weather_status_entity.dart';
import 'package:weather_check/infra/constants/weather_type_enum.dart';

void main() {
  WeatherStatusModel model;

  group('WeatherStatusModel Test', () {
    model = _getModelMock();
    test("should return correct entity for toEntity method", () {
      // Mock.
      final expectedResult = _getEntityMock();
      // Action.
      final result = model.toEntity();
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct model for fromJson method", () {
      // Mock.
      final expectedResult = _getModelMock();
      // Action.
      final result = WeatherStatusModel.fromJson(_getJsonMock());
      // Assert.
      expect(result, expectedResult);
    });
  });
}

WeatherStatusEntity _getEntityMock() {
  return WeatherStatusEntity(
    id: 200,
    name: "main",
    description: "description",
    type: WeatherType.thunderstorm,
  );
}

WeatherStatusModel _getModelMock() {
  return WeatherStatusModel(weatherList: [
    WeatherStatusTypeModel(
      id: 200,
      main: "main",
      description: "description",
    ),
  ]);
}

Map<String, dynamic> _getJsonMock() {
  return jsonDecode("""
{
    "weather":[
        {
            "id": 200,
            "main": "main",
            "description": "description"
        }
    ]
}
""");
}
