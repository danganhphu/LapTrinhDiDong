import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends ChangeNotifier {
  int _value = 0;
  Future<int> get value async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _value = sharedPreferences.getInt("counter") ?? 0;
    return _value;
  }

  void increasement() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("counter", ++_value)
        .whenComplete(() => notifyListeners());

    notifyListeners();
  }
}