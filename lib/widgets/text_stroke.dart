import 'package:flutter/material.dart';

class TextStroke extends StatelessWidget {
  const TextStroke(
    this.title, {
    super.key,
    this.fontSize = 20,
    this.strokeWidth = 4,
    this.fontFamily = 'w700',
    this.borderColor = Colors.black,
    this.textColor = Colors.white,
  });

  final String title;
  final double fontSize;
  final double strokeWidth;
  final String fontFamily;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = borderColor,
          ),
        ),
        // Solid text as fill.
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
