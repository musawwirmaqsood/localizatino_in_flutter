import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'), // English, no country code
    const Locale('es'), // Spanish, no country code
    const Locale('ur'), // Urdu, no country code
    const Locale('fr'), // French, no country code
  ];
  static String getFlag(String code) {
    switch (code) {
      case 'ur':
        return 'π΅π°';
      case 'fr':
        return 'π¨π¦';
      case 'es':
        return 'πͺπΈ';
      case 'en':
      default:
        return 'πΊπΈ';
    }
  }
}
