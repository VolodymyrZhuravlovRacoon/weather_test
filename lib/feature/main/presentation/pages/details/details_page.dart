import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/application/di.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/presentation/bloc/details/details_page_cubit.dart';
import 'package:test_weather/feature/main/presentation/pages/details/details_temperature_page.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  final CityListEntity cityListData;

  const DetailsPage({super.key, required this.cityListData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsPageCubit>(
      create: (context) =>
          DetailsPageCubit(mainService: getIt.get(), cityListData: cityListData)
            ..getWeatherData(),
      child: const DetailsTemperaturePage(),
    );
  }
}
