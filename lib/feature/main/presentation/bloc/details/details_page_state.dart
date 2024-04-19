import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';

enum StateType { initial, error, loading, normal }

@immutable
class DetailsPageState with EquatableMixin {
  final StateType stateType;
  final double? temperature;
  final CityListEntity item;

  const DetailsPageState({
    required this.temperature,
    required this.item,
    this.stateType = StateType.initial,
  });

  /// Initial state
  factory DetailsPageState.initial(
          {required double? temperature, required CityListEntity item}) =>
      DetailsPageState(
        temperature: temperature,
        item: item,
        stateType: StateType.initial,
      );

  DetailsPageState copyWith(
      {StateType? stateType, double? temperature, CityListEntity? item}) {
    return DetailsPageState(
      stateType: stateType ?? this.stateType,
      item: item ?? this.item,
      temperature: temperature ?? this.temperature,
    );
  }

  @override
  List<Object?> get props => [
        temperature,
        stateType,
        item,
      ];
}
