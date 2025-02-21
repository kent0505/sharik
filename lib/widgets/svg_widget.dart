import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget(
    this.assetName, {
    super.key,
    this.width,
    this.fit = BoxFit.contain,
  });

  final String assetName;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      fit: fit,
    );
  }
}
