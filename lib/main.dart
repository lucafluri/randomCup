import 'package:flutter/material.dart';
import 'package:randomcup/routes.dart';
import 'package:randomcup/themes/style.dart';

void main() {
  // TODO init app

  runApp(const CupApp());
}

class CupApp extends StatelessWidget {
  const CupApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Cup',
      theme: appTheme(),
      routes: routes,
      initialRoute: '/',
    );
  }
}
