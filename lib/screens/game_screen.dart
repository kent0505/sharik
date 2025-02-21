import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/svg_widget.dart';
import 'win_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double coef = 1.10;
  double size = 100;
  bool started = false;
  Timer? _timer;

  void onCoef(bool add) {
    setState(() {
      add ? coef += 0.1 : coef -= 0.1;
    });
  }

  void onStart() {
    if (started) {
      _stopGame(size * coef);
      return;
    }

    started = true;
    int target = Random().nextInt(211) + 150; // 150 to 360

    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (size == target) {
        _stopGame(-(size * coef));
      } else {
        setState(() {
          size++;
        });
      }
    });
  }

  void _stopGame(double coins) {
    _timer?.cancel();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WinScreen(coins: coins.round(), goHome: true),
      ),
    ).then((_) {
      setState(() {
        size = 100;
        started = false;
      });
    });
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
              SizedBox(width: 32),
              _CoefButton(
                active: coef > 1.10,
                onPressed: () {
                  onCoef(false);
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    coef.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: AppFonts.bold,
                    ),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: _CoefButton(
                  active: coef < 20,
                  onPressed: () {
                    onCoef(true);
                  },
                ),
              ),
              SizedBox(width: 32),
            ],
          ),
          SizedBox(height: 26),
          MainButton(
            title: started ? 'Stop' : 'Press Baloon',
            onPressed: onStart,
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}

class _CoefButton extends StatelessWidget {
  const _CoefButton({
    required this.active,
    required this.onPressed,
  });

  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: active ? onPressed : null,
      child: SvgWidget(active ? Assets.coef2 : Assets.coef1),
    );
  }
}
