import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

String selectedCat = 'cat';




class AnimalBloc with ChangeNotifier {
  String _selectedCat = "cat";

  AnimalBloc(){
    onLaunchGetSavedCat();
  }

  Future<void> getSavedCat() async {
  SharedPreferences prefs =  await SharedPreferences.getInstance();
    _selectedCat = prefs.getString("selectedCat")??"dog";
  }

  Future<void> onLaunchGetSavedCat() async {
    await getSavedCat();
    notifyListeners();
  }

  Future<void> setSavedCat(String value) async {
  SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.setString("selectedCat",value);
  }


  set selectedCat(String value) {
    _selectedCat = value;
    setSavedCat(value);
    notifyListeners();
  }

  get selectedCat {
    getSavedCat();
    return _selectedCat;
  }

  int _selectedPage = 0;

  set selectedPage(int value) {
    _selectedPage = value;
    notifyListeners();
  }

  int get selectedPage {
    return _selectedPage;
  }
}
