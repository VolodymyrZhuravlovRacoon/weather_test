import 'package:equatable/equatable.dart';
import 'package:test_weather/feature/main/data/model/city_list_objects.dart';

class CityListEntity extends Equatable {
  final String? objectId;
  final String? name;
  final CityListLocation? location;
  String? temperature;

  CityListEntity({
    this.objectId,
    this.name,
    this.location,
    this.temperature,
  });

  CityListEntity copyWith({
    String? objectId,
    String? name,
    CityListLocation? location,
    String? temperature,
  }) {
    return CityListEntity(
      objectId: objectId ?? this.objectId,
      name: name ?? this.name,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }

  CityListEntity.from(CityListEntity cityListEntity)
      : objectId = cityListEntity.objectId,
        name = cityListEntity.name,
        location = cityListEntity.location,
        temperature = cityListEntity.temperature;

  @override
  List<Object?> get props => [
        objectId,
        name,
        location,
        temperature,
      ];
}
