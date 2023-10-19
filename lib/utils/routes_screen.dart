import 'package:flutter/cupertino.dart';
import 'package:todo_app/screen/insert_screen.dart';

import '../screen/home_screen.dart';

Map<String, WidgetBuilder> screenRoutes = {
  '/': (Context) => HomeScreen(),
  'data': (Context) => DataScreen(),
};
