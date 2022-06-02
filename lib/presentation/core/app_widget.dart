import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lufthansa/business_logic/cubits/auth_token_cubit.dart';
import 'package:lufthansa/business_logic/cubits/departure_location_cubit.dart';
import 'package:lufthansa/presentation/core/router_generator.dart';
import 'package:lufthansa/presentation/core/theme_data.dart';
import 'package:lufthansa/presentation/welcome_page/page/welcome_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({
    Key? key,
  }) : super(key: key);

  final RouterGenerator appRouter = RouterGenerator();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthTokenCubit>(
          create: (BuildContext context) => AuthTokenCubit(),
        ),
        BlocProvider<DepartureLocationCubit>(
          create: (BuildContext context) => DepartureLocationCubit(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: 'Lufthansa Airways',
            theme: getAppTheme(context),
            home:
                Builder(builder: (BuildContext context) => const WelcomePage()),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
