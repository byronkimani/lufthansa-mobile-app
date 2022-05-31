import 'package:flutter/material.dart';
import 'package:lufthansa/presentation/core/router_generator.dart';
import 'package:lufthansa/presentation/core/theme_data.dart';
import 'package:lufthansa/presentation/homepage/page/home_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final RouterGenerator appRouter = RouterGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lufthansa Airways',
      theme: getAppTheme(context),
      home: Builder(builder: (BuildContext context) => const HomePage()),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
