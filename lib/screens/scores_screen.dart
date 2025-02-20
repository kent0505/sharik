import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/appbar.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Appbar(title: 'Leaderboard'),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
