import 'package:flutter/foundation.dart';
import 'package:provider_contact_diary_app/modals/contact_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  SharedPreferences prefs;

  final String _sfTitles = "all_title";
  final String _sfSubTitles = "all_sub_title";

  List<String> _allTitles = [];
  List<String> _allSubTitles = [];

  List<Contact> allContacts = [];

  ListController({required this.prefs});

  List<String> get getTitles {
    _allTitles = prefs.getStringList(_sfTitles) ?? [];
    return _allTitles;
  }

  List<String> get getSubTitles {
    _allSubTitles = prefs.getStringList(_sfSubTitles) ?? [];
    return _allSubTitles;
  }

  List<Contact> get getAllContacts {
    _allTitles = prefs.getStringList(_sfTitles) ?? [];
    _allSubTitles = prefs.getStringList(_sfSubTitles) ?? [];

    // _allTitles.forEach((element) {
    //   allContacts.add(Contact(title: element, subTitle: _allSubTitles[_allTitles.indexOf(element)]));
    // });

    allContacts = List.generate(
      _allTitles.length,
      (index) => Contact(
        title: _allTitles[index],
        subTitle: _allSubTitles[index],
      ),
    );

    return allContacts;
  }

  void addItem({required String title, required String subtitle}) {
    _allTitles = prefs.getStringList(_sfTitles) ?? [];
    _allSubTitles = prefs.getStringList(_sfSubTitles) ?? [];

    _allTitles.add(title);
    _allSubTitles.add(subtitle);

    prefs.setStringList(_sfTitles, _allTitles);
    prefs.setStringList(_sfSubTitles, _allSubTitles);
    notifyListeners();
  }

  void removeItem({required int index}) {
    _allTitles = prefs.getStringList(_sfTitles) ?? [];
    _allSubTitles = prefs.getStringList(_sfSubTitles) ?? [];

    _allTitles.removeAt(index);
    _allSubTitles.removeAt(index);

    prefs.setStringList(_sfTitles, _allTitles);
    prefs.setStringList(_sfSubTitles, _allSubTitles);
    notifyListeners();
  }
}
