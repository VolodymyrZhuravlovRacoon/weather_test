// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherBody _$WeatherBodyFromJson(Map<String, dynamic> json) => WeatherBody(
      main: json['main'] == null
          ? null
          : WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherBodyToJson(WeatherBody instance) =>
    <String, dynamic>{
      'main': instance.main?.toJson(),
    };

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) => WeatherMain(
      temp: (json['temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };
