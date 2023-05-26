import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  SharedPreferences? prefs;
  String sfFirst = "is_first_time";
  bool firstTime = false;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool checkFirstTime() {
    init();
    if (prefs != null) {
      firstTime = prefs!.getBool(sfFirst) ?? true;
      if (firstTime) {
        prefs!.setBool(sfFirst, false);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}