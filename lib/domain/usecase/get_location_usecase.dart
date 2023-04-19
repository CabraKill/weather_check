import 'package:weather_check/domain/entities/location_entity.dart';
import 'package:weather_check/domain/entities/usecase_response_entity.dart';

abstract class GetLocationUsecase {
  //TODO create a specify exception for this usecase
  Future<UseCaseResponseEntity<LocationEntity, Exception>> call();
}
