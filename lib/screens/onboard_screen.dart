import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/main_button.dart';
import '../widgets/text_stroke.dart';
import 'home_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: -260,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(25 / 360),
              child: Image.asset(
                Assets.onboard2,
                width: 690,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: -30,
            child: Image.asset(
              Assets.onboard1,
              width: 340,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 16 + MediaQuery.of(context).viewPadding.top),
              TextStroke(
                'Step right in and enjoy the game!',
                fontSize: 32,
                fontFamily: AppFonts.lemon,
                strokeWidth: 8,
              ),
              Spacer(),
              MainButton(
                title: 'Let’s Get Started',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              SizedBox(height: 46),
            ],
          ),
        ],
      ),
    );
  }
}
