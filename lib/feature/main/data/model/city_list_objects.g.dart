// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListBody _$CityListBodyFromJson(Map<String, dynamic> json) => CityListBody(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CityListResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityListBodyToJson(CityListBody instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

CityListResult _$CityListResultFromJson(Map<String, dynamic> json) =>
    CityListResult(
      objectId: json['objectId'] as String?,
      location: json['location'] == null
          ? null
          : CityListLocation.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityListResultToJson(CityListResult instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'name': instance.name,
      'location': instance.location?.toJson(),
    };

CityListLocation _$CityListLocationFromJson(Map<String, dynamic> json) =>
    CityListLocation(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CityListLocationToJson(CityListLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
