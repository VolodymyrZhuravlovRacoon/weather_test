import 'package:json_annotation/json_annotation.dart';

part 'weather_objects.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherBody {
  WeatherMain? main;

  WeatherBody({
    this.main,
  });

  factory WeatherBody.fromJson(Map<String, dynamic> json) =>
      _$WeatherBodyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WeatherMain {
  double? temp;

  WeatherMain({
    this.temp,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}
