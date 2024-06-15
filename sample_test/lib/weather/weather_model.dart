class WeatherEntity {
  final String cityName;

  const WeatherEntity({required this.cityName});
}

class WeatherModel extends WeatherEntity {
  const WeatherModel({required super.cityName});
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      WeatherModel(cityName: json["name"]);
}

// class WeatherModel extends WeatherEntity {
//   const WeatherModel({
//     required super.cityName,
//     required super.main,
//     required super.description,
//     required super.iconCode,
//     required super.temperature,
//     required super.pressure,
//     required super.humidity,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       cityName: json["name"],
//       main: json["weather"][0]["main"],
//       description: json["weather"][0]["description"],
//       iconCode: json["weather"][0]["icon"],
//       temperature: json["main"]["temp"],
//       pressure: json["main"]["pressure"],
//       humidity: json["main"]["humidity"],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "weather": [
//         {
//           "main": main,
//           "description": description,
//           "icon": iconCode,
//         }
//       ],
//       "main": [
//         {
//           "temp": temperature,
//           "pressure": pressure,
//           "humidity": humidity,
//         }
//       ],
//       "name": cityName,
//     };
//   }
// }
