import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/Presidents_service.dart';
import 'package:votiship/presentation/screens/details_screen.dart';
import 'package:votiship/presentation/screens/presedints_screen.dart';
import 'package:votiship/routes_constants.dart';

class AppRoute {
  // AppRoute() {
  //   presidentDataService = PresidentDataService();
  //   presidentBloc = PresidentBloc(presidentsService: presidentDataService);
  // }

  Route<dynamic> createRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case detailsScreenRoute:
        return MaterialPageRoute(builder: (newContext) => DetailsScreen());

      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
