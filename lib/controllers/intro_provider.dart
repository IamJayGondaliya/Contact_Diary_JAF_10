import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroProvider extends ChangeNotifier {
  SharedPreferences? prefs;
  String sfFirst = "is_first_time";
  bool firstTime = true;

  IntroProvider({required this.prefs});

  bool get isFirstTime {
    firstTime = prefs!.getBool(sfFirst) ?? true;
    return firstTime;
  }

  void firstDone() {
    firstTime = false;
    prefs!.setBool(sfFirst, firstTime);
  }
}
