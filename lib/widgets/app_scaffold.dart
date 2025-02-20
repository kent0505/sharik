import 'package:flutter/material.dart';

import '../core/constants.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: body,
      ),
    );
  }
}
