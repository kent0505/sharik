import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wheel/wheel_bloc.dart';
import '../core/constants.dart';
import '../core/utils.dart';
import '../screens/win_screen.dart';
import 'button.dart';
import 'svg_widget.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WheelBloc, WheelState>(
      listener: (context, state) {
        if (state is WheelStopped && state.canSpin) {
          // push to win page
          logger(state.amount);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinScreen(amount: state.amount),
            ),
          );
        }
      },
      builder: (context, state) {
        final active =
            state is WheelInitial || state is WheelStopped && state.canSpin;

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
            Container(
              height: 111,
              width: 111,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 300),
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
          ],
        );
      },
    );
  }
}
