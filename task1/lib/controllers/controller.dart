import 'package:flutter/cupertino.dart';

import '../views/form.dart';

class control with ChangeNotifier {
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
}
