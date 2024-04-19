import 'package:json_annotation/json_annotation.dart';

part 'city_list_objects.g.dart';

@JsonSerializable(explicitToJson: true)
class CityListBody {
  List<CityListResult>? results;

  CityListBody({
    this.results,
  });

  factory CityListBody.fromJson(Map<String, dynamic> json) =>
      _$CityListBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CityListBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CityListResult {
  String? objectId;
  String? name;
  CityListLocation? location;

  CityListResult({
    this.objectId,
    this.location,
    this.name,
  });

  factory CityListResult.fromJson(Map<String, dynamic> json) =>
      _$CityListResultFromJson(json);

  Map<String, dynamic> toJson() => _$CityListResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CityListLocation {
  double? latitude;
  double? longitude;

  CityListLocation({
    this.latitude,
    this.longitude,
  });

  factory CityListLocation.fromJson(Map<String, dynamic> json) =>
      _$CityListLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CityListLocationToJson(this);
}
