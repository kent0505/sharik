import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/coins/coins_bloc.dart';
import '../core/constants.dart';
import '../screens/settings_screen.dart';
import '../screens/scores_screen.dart';
import 'button.dart';
import 'svg_widget.dart';
import 'text_stroke.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    this.title = '',
    this.home = false,
    this.game = false,
  });

  final String title;
  final bool home;
  final bool game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16 + MediaQuery.of(context).viewPadding.top,
        bottom: 16,
      ),
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            SizedBox(width: 16),
            if (home) ...[
              Button(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                child: SvgWidget(Assets.settings),
              ),
              SizedBox(width: 8),
              _CoinsCard(),
              SizedBox(width: 8),
              Button(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScoresScreen(),
                    ),
                  );
                },
                child: SvgWidget(Assets.scores),
              )
            ] else ...[
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: SvgWidget(Assets.back),
              ),
              if (game) ...[
                SizedBox(width: 8),
                _CoinsCard(width: MediaQuery.of(context).size.width - 72)
              ] else ...[
                Expanded(
                  child: Center(
                    child: TextStroke(
                      title,
                      fontSize: 18,
                      fontFamily: AppFonts.bold,
                    ),
                  ),
                ),
                SizedBox(width: 72),
              ],
            ],
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _CoinsCard extends StatelessWidget {
  const _CoinsCard({this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgWidget(
            Assets.coinsCard,
            width: width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgWidget(Assets.coin),
                SizedBox(width: 8),
                BlocBuilder<CoinsBloc, CoinsState>(
                  builder: (context, state) {
                    return TextStroke(
                      state is CoinsLoaded ? state.coins.toString() : '',
                      fontSize: 18,
                      fontFamily: AppFonts.bold,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
