import 'package:flutter/foundation.dart';

//controller
class CounterController extends ChangeNotifier {
  //attributes
  int counter = 0;

  //methods
  void increaseCounter() {
    counter++;
    notifyListeners();
  }
}
