import 'package:flutter/material.dart';
import '../utils/ar.dart';
import '../utils/en.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': EN.english,
    'ar': AR.arabic,
  };

  Map<String, String> get title {
    return _localizedValues[locale.languageCode];
  }

  String get login {
    return _localizedValues[locale.languageCode]['login'];
  }
}
