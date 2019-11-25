import 'package:flutter/material.dart';

import 'routes/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferramenta Avaloo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      routes: routes(context),
      initialRoute: "home",
    );
  }
}
