import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:randomcup/screens/capture/capture.dart';
import 'package:randomcup/screens/selection/selection_screen.dart';

import 'screens/home/home.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  CaptureScreen.routeName: (BuildContext context) => CaptureScreen(),
  SelectionScreen.routeName: (BuildContext context) => SelectionScreen(),
  // "/add": (context) => CaptureScreen(),
  // "/settings": (context) => SettingsScreen(),
  // "/settings/devs": (context) => DevsScreen(),
};
