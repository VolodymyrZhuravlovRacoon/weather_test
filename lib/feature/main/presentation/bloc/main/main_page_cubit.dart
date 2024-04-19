import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/domain/service/main_service.dart';
import 'package:test_weather/feature/main/presentation/bloc/main/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final MainService _mainService;

  MainPageCubit(this._mainService)
      : super(MainPageState.initial(cityListData: const []));

  Future<void> getCityList() async {
    emit(state.copyWith(stateType: StateType.loading));
    try {
      final cityListObjects = await _mainService.getCityDataList();
      emit(
        state.copyWith(
          stateType: StateType.normal,
          cityListData: cityListObjects,
        ),
      );
    } catch (e) {
      emit(state.copyWith(stateType: StateType.error));
    }
  }

  void updateCityListItem(CityListEntity cityListData, double? temperature) {
    // final cityList = state.cityListData;
    int index = state.cityListData.indexOf(cityListData);
    if (index != -1) {
      emit(
        state.copyWith(stateType: StateType.loading),
      );
      state.cityListData[index] = CityListEntity(
          objectId: cityListData.objectId,
          name: cityListData.name,
          location: cityListData.location,
          temperature: temperature?.toString());
      emit(
        state.copyWith(
          stateType: StateType.normal,
          cityListData: state.cityListData,
        ),
      );
    }
  }
}
