import 'package:flutter/material.dart';
import 'package:localization_example/auth/auth_localization.dart';
import 'package:localization_example/localizations/app_localizations.dart';
import 'package:localization_example/localizations/supported_locales.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      home: HomePage(localization: AuthLocalization()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.localization}) : super(key: key);

  final AuthLocalization localization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.title),
      ),
    );
  }
}
