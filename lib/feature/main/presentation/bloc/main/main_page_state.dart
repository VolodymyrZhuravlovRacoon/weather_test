import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';

enum StateType { initial, error, loading, normal }

@immutable
class MainPageState with EquatableMixin {
  final StateType stateType;
  final List<CityListEntity> cityListData;

  const MainPageState({
    required this.cityListData,
    this.stateType = StateType.initial,
  });

  /// Initial state
  factory MainPageState.initial({required List<CityListEntity> cityListData}) =>
      MainPageState(
        cityListData: cityListData,
        stateType: StateType.initial,
      );

  MainPageState copyWith(
      {StateType? stateType, List<CityListEntity>? cityListData}) {
    return MainPageState(
      stateType: stateType ?? this.stateType,
      cityListData: cityListData ?? this.cityListData,
    );
  }

  @override
  List<Object?> get props => [
        cityListData,
        stateType,
      ];
}
