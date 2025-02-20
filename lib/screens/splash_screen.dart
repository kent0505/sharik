import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/coins/coins_bloc.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/loading_widget.dart';
import '../data/onboard_repository.dart';
import 'home_screen.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocListener<CoinsBloc, CoinsState>(
        listener: (context, state) {
          if (state is CoinsLoaded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return context.read<OnboardRepository>().isOnBoard()
                            ? OnboardScreen()
                            : HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
                }
              },
            );
          }
        },
        child: Center(
          child: LoadingWidget(),
        ),
      ),
    );
  }
}
