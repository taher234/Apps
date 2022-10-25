import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weathModel.dart';

class weatherServices {
  Future<List<weathModel>> getWeath({required String cityName}) async {
    http.Response res = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=7141fe825da044eea0790939221610&q=$cityName&days=7&aqi=no&alerts=no'));
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      List<dynamic> forcast = data['forecast']['forecastday'];
      List<weathModel> w =
          forcast.map((dynamic e) => weathModel.fromJson(e)).toList();
      return w;
    } else {
      throw Exception('Error!');
    }
  }
}
