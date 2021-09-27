import 'package:flutter/material.dart';

import 'package:votiship/routes_constants.dart';
import 'routes.dart' as router;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votiship',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeViewRoute,
      onGenerateRoute: router.createRoute,
    );
  }
}
