import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_weather/feature/main/presentation/pages/main/main_list_page.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainListPage();
  }
}
