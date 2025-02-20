import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart';
import '../widgets/wheel_widget.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Appbar(home: true),
          WheelWidget(),
          Spacer(),
          MainButton(
            title: 'Start Game',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(),
                ),
              );
            },
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}
