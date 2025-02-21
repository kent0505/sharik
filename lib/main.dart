import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants.dart';
import 'core/themes.dart';
import 'blocs/coins/coins_bloc.dart';
import 'blocs/wheel/wheel_bloc.dart';
import 'data/coins_repository.dart';
import 'data/onboard_repository.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<CoinsRepository>(
          create: (context) => CoinsRepositoryImpl(prefs: prefs),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CoinsBloc(
              repository: context.read<CoinsRepository>(),
            )..add(LoadCoins()),
          ),
          BlocProvider(
            create: (context) => WheelBloc(
              repository: context.read<CoinsRepository>(),
            )..add(CheckAmount()),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(Assets.bg), context);
    precacheImage(AssetImage(Assets.balloon), context);
    precacheImage(AssetImage(Assets.onboard1), context);
    precacheImage(AssetImage(Assets.onboard2), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SplashScreen(),
    );
  }
}
