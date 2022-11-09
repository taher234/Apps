import 'package:flutter/cupertino.dart';

import '../views/login&rigster/form.dart';

class control with ChangeNotifier {
  int currentIndex = 0;
  int count = 0;
  changePages(value) {
    currentIndex = value;
    notifyListeners();
  }

  bool obscu = false;
  changeObs() {
    obscu = !obscu;
    notifyListeners();
  }

  Auth au = Auth.login;
  void SwitchAuth() {
    if (au == Auth.login) {
      au = Auth.register;
      notifyListeners();
    } else {
      au = Auth.login;
      notifyListeners();
    }
  }

  increament() {
    count++;
    notifyListeners();
  }

  decreament() {
    if (count == 0) {
      count = 0;
    } else {
      count--;
    }
    notifyListeners();
  }
}
