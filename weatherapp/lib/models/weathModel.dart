class weathModel {
  //cond condition;
  String? date, icon, status;
  double temp,
      minTemp,
      maxTemp,
      realFeelC,
      realFeelF,
      pressure_mb,
      wind_kph,
      wind_mph;
  int humidity;
  weathModel(
      {required this.status,
      required this.icon,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.realFeelC,
      required this.realFeelF,
      required this.pressure_mb,
      required this.humidity,
      required this.wind_kph,
      required this.wind_mph});

  factory weathModel.fromJson(dynamic data) {
    return weathModel(
      status: data['day']['condition']['text'],
      icon: data['day']['condition']['icon'],
      date: data['date'],
      temp: data['day']['avgtemp_c'],
      minTemp: data['day']['mintemp_c'],
      maxTemp: data['day']['maxtemp_c'],
      realFeelC: data['hour'][0]['feelslike_c'],
      realFeelF: data['hour'][0]['feelslike_f'],
      pressure_mb: data['hour'][0]['pressure_mb'],
      humidity: data['hour'][0]['humidity'],
      wind_kph: data['hour'][0]['wind_kph'],
      wind_mph: data['hour'][0]['wind_mph'],
    );
  }
}
