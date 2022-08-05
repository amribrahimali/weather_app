import 'package:network_service_repository/network_service_repository.dart';
import 'package:weather_repository/weather_repository.dart';
import 'models/models.dart';

class WeatherRepository {
  WeatherRepository({NetworkService? networkService})
      : _networkService = networkService ?? NetworkService();

  final NetworkService _networkService;

  /// Fetch Weather Data.
  ///
  /// [city] parameter is the selected city.
  /// [location] parameter is current location.
  Future<Weather> getWeather({String? city, String? location}) async {
    final response = await _networkService
        .get(city == null ? '/data/weather/$location' : '/data/weather/$city');
    return Weather.fromJson(response.data);
  }
}
