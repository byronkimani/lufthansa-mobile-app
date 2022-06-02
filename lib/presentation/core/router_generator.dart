import 'package:flutter/material.dart';
import 'package:lufthansa/data/constants/routes.dart';
import 'package:lufthansa/presentation/arrival/page/arrival_page.dart';
import 'package:lufthansa/presentation/core/page_not_found.dart';
import 'package:lufthansa/presentation/departure/page/departure_page.dart';
import 'package:lufthansa/presentation/welcome_page/page/welcome_page.dart';

class RouterGenerator {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case welcomePageRoute:
        return MaterialPageRoute<WelcomePage>(
          builder: (BuildContext context) => const WelcomePage(),
        );

      case departurePageRoute:
        return MaterialPageRoute<DeparturePage>(
          builder: (BuildContext context) => const DeparturePage(),
        );

      case arrivalPageRoute:
        return MaterialPageRoute<ArrivalPage>(
          builder: (BuildContext context) => const ArrivalPage(),
        );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (BuildContext context) => const PageNotFound(),
        );
    }
  }
}
