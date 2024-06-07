class Urls {
  static const String baseUrl = "https://api.openweathermap.org/data/2.5";
  static const String apiKey = "8879cf64d3a45f92840712e7edb75fc0";
  static String currentWeatherByName(String city) =>
      "$baseUrl/weather?q=$city&appid=$apiKey";
  static String weatherIcon(String iconCode) =>
      "https://openweathermap.org/img/wn/$iconCode@2x.png";
}
