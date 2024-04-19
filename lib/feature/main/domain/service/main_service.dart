import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/domain/entity/weather_entity.dart';

abstract class MainService {
  Future<List<CityListEntity>> getCityDataList();
  Future<WeatherEntity> getWeatherData(double lat, double lon);
}
