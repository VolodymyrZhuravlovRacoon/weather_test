import 'package:test_weather/feature/main/data/data_sourse/main_data_source.dart';
import 'package:test_weather/feature/main/domain/entity/city_list_entity.dart';
import 'package:test_weather/feature/main/domain/entity/weather_entity.dart';
import 'package:test_weather/feature/main/domain/service/main_service.dart';

class MainServiceImpl implements MainService {
  final _dataSource = MainDataSourceImpl();

  @override
  Future<List<CityListEntity>> getCityDataList() {
    return _dataSource.getCityDataList();
  }

  @override
  Future<WeatherEntity> getWeatherData(double lat, double lon) {
    return _dataSource.getWeatherData(lat, lon);
  }
}
