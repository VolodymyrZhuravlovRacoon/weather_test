import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final double? temperature;

  const WeatherEntity({
    this.temperature,
  });

  WeatherEntity.from(WeatherEntity cityListEntity)
      : temperature = cityListEntity.temperature;

  @override
  List<Object?> get props => [
        temperature,
      ];
}
