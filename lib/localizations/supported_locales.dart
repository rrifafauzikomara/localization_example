import 'dart:ui';

/// https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
const Locale english = Locale('en', 'US');
const Locale indonesian = Locale('id', 'ID');

final String defaultLanguage = english.languageCode;
final Set<Locale> supportedLocales = {english, indonesian};

final List<String> supportedLanguages = [
  english.languageCode,
  indonesian.languageCode,
];
