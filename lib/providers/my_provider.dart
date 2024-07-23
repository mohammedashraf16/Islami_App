import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  String appLanguage = "en";

  getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? isEnglish = prefs.getString("isEnglish");
    if (isEnglish != "en") {
      if (isEnglish == "en") {
        appLanguage = "en";
      }else{
        appLanguage ="ar";
      }
      notifyListeners();
    }
  }

  changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isEnglish", appLanguage);
    notifyListeners();
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDark");
    if (isDark != null) {
      if (isDark == true) {
        mode = ThemeMode.dark;
      } else {
        mode = ThemeMode.light;
      }
      notifyListeners();
    }
  }

  changeTheme(ThemeMode themeMode) async {
    if (mode == themeMode) {
      return;
    }
    mode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", mode == ThemeMode.dark);
    notifyListeners();
  }

  bool isDark() {
    return mode == ThemeMode.dark;
  }
}
