import 'package:flutter/material.dart';
import 'package:localization_example/localizations/languages/en.dart';
import 'package:localization_example/localizations/languages/id.dart';

import 'supported_locales.dart';

class LocalizationsFunction {
  LocalizationsFunction();

  /// Set en as default
  Map<String, dynamic> _currentLocale = en;

  String _getLanguageCode(Locale locale) {
    if (supportedLanguages.contains(locale.languageCode)) {
      return locale.languageCode;
    }

    /// For englishPhilippines 'en-PH'
    if (supportedLanguages.contains(locale.toLanguageTag())) {
      return locale.toLanguageTag();
    }

    return defaultLanguage;
  }

  String call(String key, {Map<String, dynamic>? params}) {
    String text = _currentLocale[key] ?? en[key];

    if (params == null) {
      return text;
    }
    params.forEach((key, dynamic value) {
      if (value is List) {
        for (var data in value) {
          text = text.replaceFirst(key, data);
        }
      } else {
        text = text.replaceFirst(key, value);
      }
    });
    return text;
  }

  void loadLocalizations(Locale locale) {
    String code = _getLanguageCode(locale);
    if ('en' == code) {
      _currentLocale = en;
    } else if ('id' == code) {
      _currentLocale = id;
    } else {
      _currentLocale = en;
    }
  }
}
