import 'package:flutter/material.dart';
import 'package:votiship/presentation/screens/details_screen.dart';
import 'package:votiship/presentation/screens/presedints_screen.dart';
import 'package:votiship/routes_constants.dart';

Route<dynamic> createRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());

    case detailsScreenRoute:
      return MaterialPageRoute(builder: (context) => DetailsScreen());

    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
