import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/appbar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Appbar(title: 'Privacy Policy'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem ipsum',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: AppFonts.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Dolor sit amet, consectetur adipiscing elit. Suspendisse tempus auctor nisi, eu mollis',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: AppFonts.medium,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Lorem ipsum',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: AppFonts.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Dolor sit amet, consectetur adipiscing elit. Suspendisse tempus auctor nisi, eu mollis',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: AppFonts.medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
