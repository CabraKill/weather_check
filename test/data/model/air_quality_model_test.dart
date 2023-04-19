import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_check/data/model/air_quality_details_item_components_model.dart';
import 'package:weather_check/data/model/air_quality_details_item_model.dart';

import 'package:weather_check/data/model/air_quality_model.dart';
import 'package:weather_check/domain/entities/air_quality_entity.dart';

void main() {
  AirQualityModel model;

  group('AirQualityModel Test', () {
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
      final result = AirQualityModel.fromJson(_getJsonMock());
      // Assert.
      expect(result, expectedResult);
    });
  });
}

AirQualityEntity _getEntityMock() {
  return AirQualityEntity(
    so2: 0,
    no2: 1,
    pm10: 2,
    pm25: 3,
    o3: 4,
    co: 5,
    nh3: 6,
    no: 7,
  );
}

AirQualityModel _getModelMock() {
  return AirQualityModel(
    details: [
      AirQualityDetailsItemModel(
        main: {
          "aqi": 1,
        },
        components: AirQualityDetailsItemComponentsModel(
          so2: 0,
          no2: 1,
          pm10: 2,
          pm2_5: 3,
          o3: 4,
          co: 5,
          nh3: 6,
          no: 7,
        ),
      )
    ],
  );
}

Map<String, dynamic> _getJsonMock() {
  return jsonDecode("""
{
    "coord": {
        "lon": 0,
        "lat": 1
    },
    "list": [
        {
            "main": {
                "aqi": 1
            },
            "components": {
                "so2": 0,
                "no2": 1,
                "pm10": 2,
                "pm2_5": 3,
                "o3": 4,
                "co": 5,
                "nh3": 6,
                "no": 7
            },
            "dt": 10000
        }
    ]
}
""");
}
