import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/feature/main/presentation/bloc/main/main_page_cubit.dart';
import 'package:test_weather/feature/main/presentation/bloc/main/main_page_state.dart';
import 'package:test_weather/feature/main/presentation/widgets/city_list_item_widget.dart';
import 'package:test_weather/gen/assets.gen.dart';
import 'package:test_weather/routing/app_router.dart';
import 'package:test_weather/shared/res/dimens.dart';
import 'package:test_weather/shared/widgets/layouts/base_state_info_layout.dart';
import 'package:test_weather/shared/widgets/layouts/simple_layout.dart';

class MainListPage extends StatefulWidget {
  const MainListPage({super.key});

  @override
  MainListPageState createState() => MainListPageState();
}

class MainListPageState extends State<MainListPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(AppSize.k0), // here the desired height
        child: AppBar(),
      ),
      body: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          return SimpleLayout(
            onRetry: () =>
                BlocProvider.of<MainPageCubit>(context).getCityList(),
            retryText: 'Refresh',
            isLoading: state.stateType == StateType.loading,
            isError: state.stateType == StateType.error,
            child: buildConsultingList(context, state),
          );
        },
      ),
    );
  }

  Widget buildConsultingList(BuildContext context, MainPageState state) {
    var child = state.cityListData.isEmpty
        ? Column(
            children: [
              BaseStateInfoLayout(
                title: ('No Data'),
                imagePath: Assets.images.smileCry.keyName,
              )
            ],
          )
        : ListView.builder(
            padding: const EdgeInsets.only(top: AppSize.k20),
            physics: const ScrollPhysics().parent,
            shrinkWrap: true,
            itemCount: state.cityListData.length,
            itemBuilder: (ctx, i) {
              final item = state.cityListData[i];
              return CityListItemWidget(
                onTab: () => context.router.push(
                  DetailsRoute(cityListData: item),
                ),
                temperature: item.temperature,
                name: item.name,
              );
            },
          );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.k8),
      ),
      child: RefreshIndicator(
        onRefresh: () => BlocProvider.of<MainPageCubit>(context).getCityList(),
        child: child,
      ),
    );
  }
}
