import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/Presidents_service.dart';

import 'package:votiship/routes_constants.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  final AppRoute route = AppRoute();
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PresidentBloc(presidentsService: PresidentDataService()),
      child: MaterialApp(
        title: 'Votiship',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: homeViewRoute,
        onGenerateRoute: route.createRoute,
      ),
    );
  }
}
