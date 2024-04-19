import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/presentation/pages/details/details_page.dart';
import 'package:test_weather/feature/main/presentation/pages/main/main_page.dart';

part 'package:test_weather/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
      path: '/',
    ),
    AutoRoute(page: DetailsRoute.page, path: '/DetailPage'),
  ];
}
