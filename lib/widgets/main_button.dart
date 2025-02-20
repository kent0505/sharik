import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'button.dart';
import 'svg_widget.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgWidget(Assets.button),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: AppFonts.lemon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
