import 'package:flutter/material.dart';
import 'package:lufthansa/data/constants/routes.dart';
import 'package:lufthansa/presentation/core/page_not_found.dart';
import 'package:lufthansa/presentation/homepage/page/home_page.dart';

class RouterGenerator {
  Route<dynamic> onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings?.name) {
      case homepageRoute:
        return MaterialPageRoute<HomePage>(
          builder: (BuildContext context) => const HomePage(),
        );

      default:
        return MaterialPageRoute<PageNotFound>(
          builder: (BuildContext context) => const PageNotFound(),
        );
    }
  }
}
