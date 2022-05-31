import 'package:flutter/material.dart';
import 'package:lufthansa/presentation/core/theme_data.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lufthansa Airways',
      theme: getAppTheme(context),
      home: Container(),
    );
  }
}
