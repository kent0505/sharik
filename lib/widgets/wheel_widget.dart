import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wheel/wheel_bloc.dart';
import '../core/constants.dart';
import '../screens/win_screen.dart';
import 'button.dart';
import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WheelBloc, WheelState>(
      listener: (context, state) {
        if (state is WheelDialog) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinScreen(coins: state.coins),
            ),
          );
        }
      },
      builder: (context, state) {
        final active =
            state is WheelStopped && state.canSpin && state.amount != 0;
        final zero = state is WheelStopped && state.amount == 0;

        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRotation(
              turns: state is WheelStopped ? state.turns : 0,
              curve: Curves.easeInOutCirc,
              duration: const Duration(seconds: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgWidget(Assets.wheel1),
                  SvgWidget(Assets.wheel2),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: SizedBox.square(dimension: 304),
                  ),
                  SvgWidget(Assets.wheel3),
                ],
              ),
            ),
            Positioned(
              top: 80,
              child: SvgWidget(Assets.wheel4),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SizedBox.square(dimension: 111),
            ),
            Opacity(
              opacity: active ? 1 : 0,
              child: Button(
                onPressed: active
                    ? () {
                        context.read<WheelBloc>().add(StartWheel());
                      }
                    : null,
                child: SvgWidget(Assets.wheel5),
              ),
            ),
            if (zero)
              Text(
                'Come\ntomorrow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: AppFonts.lemon,
                ),
              ),
          ],
        );
      },
    );
  }
}
