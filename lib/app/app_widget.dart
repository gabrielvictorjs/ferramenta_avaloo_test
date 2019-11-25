import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferramenta Avaloo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
