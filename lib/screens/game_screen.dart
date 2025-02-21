import 'dart:async';

import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart';
import '../widgets/app_scaffold.dart';
import 'win_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double size = 100;
  Timer? _timer;

  void onStart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WinScreen(
          coins: 0,
          goHome: true,
        ),
      ),
    );
    // _timer = Timer.periodic(
    //   Duration(milliseconds: 100),
    //   (timer) {
    //     if (size == 360) {
    //       _timer?.cancel();
    //       logger('CANCEL');
    //     } else {
    //       logger('SIZE++');
    //       setState(() {
    //         size++;
    //       });
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Appbar(game: true),
          Expanded(
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Color(0xFFffff9b),
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  Assets.balloon,
                  height: size,
                ),
              ),
            ),
          ),
          Row(
            children: [
              // coef
            ],
          ),
          SizedBox(height: 26),
          MainButton(
            title: 'Press Baloon',
            onPressed: onStart,
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}
