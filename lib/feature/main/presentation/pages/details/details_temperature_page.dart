import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/feature/main/presentation/bloc/details/details_page_cubit.dart';
import 'package:test_weather/feature/main/presentation/bloc/details/details_page_state.dart';
import 'package:test_weather/feature/main/presentation/bloc/main/main_page_cubit.dart';
import 'package:test_weather/gen/assets.gen.dart';
import 'package:test_weather/shared/res/dimens.dart';
import 'package:test_weather/shared/res/styles.dart';
import 'package:test_weather/shared/widgets/layouts/base_state_info_layout.dart';
import 'package:test_weather/shared/widgets/layouts/simple_layout.dart';

class DetailsTemperaturePage extends StatefulWidget {
  const DetailsTemperaturePage({super.key});

  @override
  DetailsTemperaturePageState createState() => DetailsTemperaturePageState();
}

class DetailsTemperaturePageState extends State<DetailsTemperaturePage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsPageCubit, DetailsPageState>(
      builder: (context, state) {
        return PopScope(
          canPop: true,
          onPopInvoked: (value) {
            BlocProvider.of<MainPageCubit>(context)
                .updateCityListItem(state.item, state.temperature);
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Details'),
            ),
            body: SimpleLayout(
              onRetry: () =>
                  BlocProvider.of<DetailsPageCubit>(context).getWeatherData(),
              retryText: 'Refresh',
              isLoading: state.stateType == StateType.loading,
              isError: state.stateType == StateType.error,
              child: buildConsultingList(context, state),
            ),
          ),
        );
      },
    );
  }

  Widget buildConsultingList(BuildContext context, DetailsPageState state) {
    var child = state.temperature == null
        ? Column(
            children: [
              BaseStateInfoLayout(
                title: ('No Data'),
                imagePath: Assets.images.smileCry.keyName,
              )
            ],
          )
        : Center(
            child: Text(
              state.temperature?.toString() ?? '',
              textAlign: TextAlign.left,
              style: AppStyles.nameTextStyle,
            ),
          );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.k8),
      ),
      child: RefreshIndicator(
        onRefresh: () =>
            BlocProvider.of<DetailsPageCubit>(context).getWeatherData(),
        child: child,
      ),
    );
  }
}
