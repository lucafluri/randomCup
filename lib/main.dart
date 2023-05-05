import 'package:flutter/material.dart';
import 'package:randomcup/routes.dart';
import 'package:randomcup/services/cup_handler.dart';
import 'package:randomcup/services/storage_service.dart';
import 'package:randomcup/themes/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initStorageService();
  if (await fileExists(cupsFileName)) restoreCups();

  runApp(const CupApp());
}

class CupApp extends StatelessWidget {
  const CupApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Mug',
      theme: appTheme(),
      routes: routes,
      initialRoute: '/',
    );
  }
}
