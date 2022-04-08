import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increasement(){
    _value++;
    notifyListeners();
  }
}