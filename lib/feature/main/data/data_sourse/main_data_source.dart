import 'package:dio/dio.dart';
import 'package:test_weather/feature/main/data/model/city_list_objects.dart';
import 'package:test_weather/feature/main/data/model/weather_objects.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/domain/entity/weather_entity.dart';
import 'package:test_weather/shared/infrastructure/logger.dart';

abstract class MainDataSource {
  Future<List<CityListEntity>> getCityDataList();

  Future<WeatherEntity> getWeatherData(double lat, double lon);
}

class MainDataSourceImpl implements MainDataSource {
  @override
  Future<List<CityListEntity>> getCityDataList() async {
    // final dio = getIt.get<Dio>();
    //Better have different Dio
    final dio = Dio();
    dio.options.headers['X-Parse-Application-Id'] =
        'WHhatLdoYsIJrRzvkD0Y93uKHTX49V9gmHgp8Rw3';
    dio.options.headers['X-Parse-Master-Key'] =
        'iyzSAHUmPKUzceWRIIitUD1OKAGHvVUzEYb5DCpj';
    final params = {
      'order': 'name',
      'keys': 'name,location',
      'limit': '20',
    };

    const newApi = 'https://parseapi.back4app.com/classes/City';

    List<CityListEntity> listData = [];
    try {
      final result = await dio.get(newApi, queryParameters: params);
      AppLogger.instance.info("Get city list success!");

      var items = CityListBody.fromJson(result.data).results;

      for (int i = 0; i < (items?.length ?? 0); i++) {
        listData.add(CityListEntity(
            objectId: items?[i].objectId,
            name: items?[i].name,
            location: items?[i].location));
      }
    } catch (error, stackTrace) {
      AppLogger.instance.warn(
        "Can't get city list!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return listData;
  }

  @override
  Future<WeatherEntity> getWeatherData(double lat, double lon) async {
    // final dio = getIt.get<Dio>();
    //In this case better have different Dio
    final dio = Dio();
    final params = {
      'lat': lat,
      'lon': lon,
      'appid': '611c5edef3dc27e0ce8bc08a43292dbb',
      'units': 'metric',
    };

    const newApi = 'https://api.openweathermap.org/data/2.5/weather';

    WeatherEntity weatherData = const WeatherEntity();
    try {
      final result = await dio.get(newApi, queryParameters: params);
      AppLogger.instance.info("Get weather data success!");

      weatherData = WeatherEntity(
          temperature: WeatherBody.fromJson(result.data).main?.temp);
    } catch (error, stackTrace) {
      AppLogger.instance.warn(
        "Can't get weather data!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return weatherData;
  }
}
