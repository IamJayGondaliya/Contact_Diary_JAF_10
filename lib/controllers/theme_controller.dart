import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  final String _sfTheme = 'is_dark';

  SharedPreferences prefs;

  ThemeProvider({required this.prefs});

  bool get getTheme {
    if (prefs.getBool(_sfTheme) ?? false) {
      _isDark = prefs.getBool(_sfTheme)!;
    } else {
      prefs.setBool(_sfTheme, _isDark);
    }
    return _isDark;
  }

  void changeTheme() {
    _isDark = !_isDark;
    prefs.setBool(_sfTheme, _isDark);
    notifyListeners();
  }
}
