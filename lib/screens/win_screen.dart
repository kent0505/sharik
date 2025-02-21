import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/coins/coins_bloc.dart';
import '../core/constants.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';
import '../widgets/text_stroke.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({
    super.key,
    required this.coins,
    this.goHome = false,
  });

  final int coins;
  final bool goHome;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Spacer(),
          TextStroke(
            coins <= 0 ? 'You Lost!' : 'Congratulate!\nYou won $coins\ncoins!',
            fontSize: 32,
            fontFamily: AppFonts.lemon,
            strokeWidth: 6,
          ),
          SizedBox(height: 34),
          coins <= 0
              ? Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Color(0xFFffff9b),
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(Assets.balloon),
                    ),
                    SvgWidget(Assets.lose),
                  ],
                )
              : SvgWidget(Assets.win),
          Spacer(),
          if (goHome) ...[
            Button(
              onPressed: () {
                context.read<CoinsBloc>().add(SaveCoins(coins: coins));
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'Go to Home',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: AppFonts.lemon,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
          MainButton(
            title: goHome ? 'Repeat Game' : 'Collect Money',
            onPressed: () {
              context.read<CoinsBloc>().add(SaveCoins(coins: coins));
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}
