import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/articlModal.dart';
import '../services/newsServics.dart';

class newsProvider with ChangeNotifier {
  Color w = Colors.white;
  Color b = Colors.black;
  bool isSwitch = false;
  int ind = 0;
  newsService service = newsService();
  List<Articles>? articls;
  String? ur;
  String st = 'egypt';
  Future launchUR(ur) async {
    if (!await launchUrl(Uri.parse('$ur'), mode: LaunchMode.platformDefault)) {
      throw 'not found url';
    }
    notifyListeners();
  }

  change(inde) {
    ind = inde;
    notifyListeners();
  }

  void sub(val) async {
    st = val;
    List<Articles> ar = await service.getNews(val);
    articls = ar;
    notifyListeners();
  }

  swit(v) {
    isSwitch = v;
    w = w == Colors.white ? Colors.black : Colors.white;
    b = b == Colors.black ? Colors.white : Colors.black;
    notifyListeners();
  }
}
