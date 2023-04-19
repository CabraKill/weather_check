import 'package:flutter/cupertino.dart';
import 'package:weather_check/infra/injections/injectable.dart';
import 'package:weather_check/presentation/pages/homePage/home_page.dart';

void main() {
  configureDependencies();
  runApp(
    const CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: HomePage(),
    ),
  );
}
