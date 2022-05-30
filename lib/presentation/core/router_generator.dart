import 'package:flutter/material.dart';
import 'package:lufthansa/data/constants/routes.dart';
import 'package:lufthansa/presentation/core/page_not_found.dart';
import 'package:lufthansa/presentation/welcome/welcome_page.dart';

class RouterGenerator {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case welcomePageRoute:
        return MaterialPageRoute<WelcomePage>(
          builder: (BuildContext context) => const WelcomePage(),
        );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (BuildContext context) => const PageNotFound(),
        );
    }
  }
}
