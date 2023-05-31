import 'package:flutter/foundation.dart';
import 'package:provider_contact_diary_app/modals/contact_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  SharedPreferences prefs;

  final String _sfTitles = "all_title";
  final String _sfSubTitles = "all_sub_title";

  final String _sfHiddenName = "all_hidden_names";
  final String _sfHiddenNumber = "all_hidden_numbers";
  final String _sfHiddenImage = "all_hidden_images";

  List<String> _allTitles = [];
  List<String> _allSubTitles = [];

  List<String> _allHiddenNames = [];
  List<String> _allHiddenNumbers = [];
  List<String> _allHiddenImages = [];

  List<Contact> allContacts = [];

  List<Contact> allHiddenContacts = [];

  ListController({required this.prefs});

  List<String> get getTitles {
    _allTitles = prefs.getStringList(_sfTitles) ?? [];
    return _allTitles;
  }

  List<String> get getSubTitles {
    _allSubTitles = prefs.getStringList(_sfSubTitles) ?? [];
    return _allSubTitles;
  }

  // List<Contact> get getAllContacts {
  //   _allTitles = prefs.getStringList(_sfTitles) ?? [];
  //   _allSubTitles = prefs.getStringList(_sfSubTitles) ?? [];
  //
  //   // _allTitles.forEach((element) {
  //   //   allContacts.add(Contact(title: element, subTitle: _allSubTitles[_allTitles.indexOf(element)]));
  //   // });
  //
  //   _allContacts = List.generate(
  //     _allTitles.length,
  //     (index) => Contact(
  //       title: _allTitles[index],
  //       subTitle: _allSubTitles[index],
  //     ),
  //   );
  //
  //   return _allContacts;
  // }

  List<Contact> get getAllHiddenContacts {
    _allHiddenNames = prefs.getStringList(_sfHiddenName) ?? [];
    _allHiddenNumbers = prefs.getStringList(_sfHiddenNumber) ?? [];
    _allHiddenImages = prefs.getStringList(_sfHiddenImage) ?? [];

    allHiddenContacts = List.generate(
      _allHiddenNumbers.length,
      (index) => Contact(
        name: _allHiddenNames[index],
        number: _allHiddenNumbers[index],
        imagePath: _allHiddenImages[index],
      ),
    );

    return allHiddenContacts;
  }

  void addHiddenContact({required String name, required String number, required String imagePath}) {
    _allHiddenNames = prefs.getStringList(_sfHiddenName) ?? [];
    _allHiddenNumbers = prefs.getStringList(_sfHiddenNumber) ?? [];
    _allHiddenImages = prefs.getStringList(_sfHiddenImage) ?? [];

    _allHiddenNames.add(name);
    _allHiddenNumbers.add(number);
    _allHiddenImages.add(imagePath);

    prefs.setStringList(_sfHiddenName, _allHiddenNames);
    prefs.setStringList(_sfHiddenNumber, _allHiddenNumbers);
    prefs.setStringList(_sfHiddenImage, _allHiddenImages);
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
