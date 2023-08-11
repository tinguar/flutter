import 'package:flutter/material.dart';

class UtilAppLocale extends ChangeNotifier {
  Locale? _locale;

  Locale get locale => _locale ?? const Locale('es');

  void changeLocale(Locale newLocale) {
    if(newLocale == const Locale('en')) {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('es');
    }
    notifyListeners();
  }
}