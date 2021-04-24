import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'), // English, no country code
    const Locale('es'), // Spanish, no country code
  ];
//This is sample comment
  static String getFlag(String code) {
    switch (code) {
      case 'es':
        return '🇪🇸';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
