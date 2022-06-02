import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:lufthansa/presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  BlocOverrides.runZoned(
    () => SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    ).then((_) {
      runApp(
        AppWidget(
          // clientId: FlutterConfig.get('CLIENT_ID'),
          // clientSecret: FlutterConfig.get('CLIENT_SECRET'),
        ),
      );
    }),
  );
}
