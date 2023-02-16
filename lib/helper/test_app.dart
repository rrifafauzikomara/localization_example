import 'package:flutter/material.dart';
import 'package:localization_example/localizations/app_localizations.dart';

class AppTestMaterialApp {
  AppTestMaterialApp({
    required Widget home,
  }) {
    widget = MaterialApp(
      localizationsDelegates: [AppLocalizations.delegate],
      key: key,
      home: home,
    );
  }

  final GlobalKey key = GlobalKey();

  BuildContext get context => key.currentContext!;

  late Widget widget;
}