import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:test_weather/application/di.dart';
import 'package:test_weather/feature/main/presentation/bloc/main/main_page_cubit.dart';
import 'package:test_weather/routing/app_router.dart';
import 'package:test_weather/shared/res/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  final _router = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: OverlaySupport.global(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) {
                return MainPageCubit(
                  getIt.get(),
                )..getCityList();
              },
            ),
          ],
          child: MaterialApp.router(
            color: Colors.white,
            theme: appTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routerConfig: _router.config(),
          ),
        ),
      ),
    );
  }
}
