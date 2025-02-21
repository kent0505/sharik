import 'package:flutter/material.dart';

import '../core/constants.dart';
import 'button.dart';
import 'svg_widget.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: active ? onPressed : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgWidget(
            active ? Assets.button : Assets.buttonDisabled,
            fit: BoxFit.fill,
          ),
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
