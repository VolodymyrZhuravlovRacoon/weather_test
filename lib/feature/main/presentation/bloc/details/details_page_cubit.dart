import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/domain/service/main_service.dart';
import 'package:test_weather/feature/main/presentation/bloc/details/details_page_state.dart';

class DetailsPageCubit extends Cubit<DetailsPageState> {
  final MainService mainService;
  final CityListEntity cityListData;

  DetailsPageCubit({required this.mainService, required this.cityListData})
      : super(DetailsPageState.initial(temperature: null, item: cityListData));

  Future<void> getWeatherData() async {
    emit(state.copyWith(stateType: StateType.loading));
    try {
      final weatherObjects = await mainService.getWeatherData(
          cityListData.location?.latitude ?? 0,
          cityListData.location?.longitude ?? 0);
      emit(
        state.copyWith(
          stateType: StateType.normal,
          temperature: weatherObjects.temperature,
        ),
      );
    } catch (e) {
      emit(state.copyWith(stateType: StateType.error));
    }
  }
}
