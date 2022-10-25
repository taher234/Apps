// ignore: file_names
import 'package:flutter/material.dart';

import '../models/weathModel.dart';
import '../services/weatherserv.dart';

// ignore: camel_case_types
class weatherController with ChangeNotifier {
  weatherServices we = weatherServices();
  List<weathModel>? data;
  String? cityNam;
  MaterialColor col = Colors.blue;
  subm(value) async {
    cityNam = value;
    List<weathModel> weath = await we.getWeath(cityName: value);
    data = weath;

    changeColor();
    notifyListeners();
  }

  changeColor() {
    if (data![0].temp < 20) {
      col = Colors.blueGrey;
    } else if (data![0].temp >= 20 && data![0].temp < 30) {
      col = Colors.yellow;
    } else if (data![0].temp >= 30 && data![0].temp < 40) {
      col = Colors.orange;
    }
    notifyListeners();
  }
}
