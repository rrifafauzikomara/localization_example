import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:localization_example/localizations/localizations_function.dart';
import 'package:localization_example/localizations/supported_locales.dart';

class AppLocalizations {
  static AppLocalizations? _instance;

  AppLocalizations._internal() {
    _instance = this;
  }

  factory AppLocalizations() => _instance ?? AppLocalizations._internal();

  late LocalizationsFunction getString = LocalizationsFunction();

  final StreamController<Locale> localeController =
      StreamController<Locale>.broadcast();

  Locale _currentLocale = english;

  Locale get locale => _currentLocale;

  static final LocalizationsDelegate<AppLocalizations> delegate =
      _LocalizationsDelegate();
}

class _LocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  _LocalizationsDelegate();

  Locale? locale;

  @override
  bool isSupported(Locale locale) {
    return supportedLanguages.contains(locale.toLanguageTag()) ||
        supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations()._currentLocale = locale;
    AppLocalizations().getString.loadLocalizations(locale);
    AppLocalizations().localeController.sink.add(locale);
    return SynchronousFuture<AppLocalizations>(AppLocalizations());
  }

  @override
  bool shouldReload(_LocalizationsDelegate old) {
    return false;
  }
}

extension MockLocalization on AppLocalizations {
  @visibleForTesting
  void mockForTest({Locale locale = const Locale('en', 'US')}) {
    AppLocalizations.delegate.load(locale).ignore();
  }
}
