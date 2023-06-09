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

  group('WeatherStatusModel.getWeatherTypeFromId Test', () {
    test("should return correct WeatherType for id 200", () {
      // Mock.
      final expectedResult = WeatherType.thunderstorm;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(200);
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct WeatherType for id 300", () {
      // Mock.
      final expectedResult = WeatherType.drizzle;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(300);
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct WeatherType for id 500", () {
      // Mock.
      final expectedResult = WeatherType.rain;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(500);
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct WeatherType for id 600", () {
      // Mock.
      final expectedResult = WeatherType.snow;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(600);
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct WeatherType for id 700", () {
      // Mock.
      final expectedResult = WeatherType.atmosphere;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(701);
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct WeatherType for id 800", () {
      // Mock.
      final expectedResult = WeatherType.clear;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(800);
      // Assert.
      expect(result, expectedResult);
    });

    test("should return correct WeatherType for id 801", () {
      // Mock.
      final expectedResult = WeatherType.clouds;
      // Action.
      final result = WeatherStatusModel.getWeatherTypeFromId(801);
      // Assert.
      expect(result, expectedResult);
    });

    test("should thrown an Exception in WeatherType for id 900", () {
      // Assert.
      expect(() => WeatherStatusModel.getWeatherTypeFromId(900),
          throwsA(isA<Exception>()));
    });
  });
}

WeatherStatusEntity _getEntityMock() {
  return WeatherStatusEntity(
    id: 200,
    name: "main",
    description: "description",
    type: WeatherType.thunderstorm,
    iconUrl: "http://openweathermap.org/img/wn/icon.png",
  );
}

WeatherStatusModel _getModelMock() {
  return WeatherStatusModel(weatherList: [
    WeatherStatusTypeModel(
      id: 200,
      main: "main",
      description: "description",
      icon: "icon",
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
            "description": "description",
            "icon": "icon"
        }
    ]
}
""");
}
