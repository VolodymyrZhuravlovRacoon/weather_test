import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_weather/feature/main/domain/service/main_service.dart';
import 'package:test_weather/feature/main/domain/service/main_service_impl.dart';

final getIt = GetIt.instance;

Future<void> initDI({Dio? dio}) async {
  getIt.registerSingleton<Dio>(dio ?? await getDio());
  getIt.registerSingleton<MainService>(MainServiceImpl());
}

Future<Dio> getDio() async {
  //Usually there are also deep networking settings
  return Dio();
}
