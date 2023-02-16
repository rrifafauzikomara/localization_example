import 'package:flutter/material.dart';
import 'package:localization_example/localizations/app_localizations.dart';
import 'package:localization_example/localizations/localizations_function.dart';

/// A wrapper class of [AppLocalizations] for root
class ExampleLocalization {
  static ExampleLocalization? _instance;

  ExampleLocalization._internal() {
    _instance = this;
  }

  factory ExampleLocalization() => _instance ?? ExampleLocalization._internal();

  late LocalizationsFunction getString = AppLocalizations().getString;

  Locale get locale => AppLocalizations().locale;
}

/// A wrapper class of [ExampleLocalization] for each feature
class AuthLocalization extends ExampleLocalization {
  AuthLocalization() : super._internal();

  String get title => getString('title');
}
