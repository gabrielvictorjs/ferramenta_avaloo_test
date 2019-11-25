import 'package:flutter/material.dart';

import '../modules/home/home_page.dart';
import '../modules/result/result_page.dart';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    "home": (context) => HomePage(),
    "result": (context) => ResultPage(),
  };
}