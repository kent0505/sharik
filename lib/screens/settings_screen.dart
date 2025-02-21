import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/coins/coins_bloc.dart';
import '../core/constants.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import 'onboard_screen.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Appbar(title: 'Settings'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _SettingsButton(
                  title: 'Notifications',
                  onPressed: () {
                    AppSettings.openAppSettings(
                      type: AppSettingsType.notification,
                    );
                  },
                ),
                _SettingsButton(
                  title: 'Privacy Policy',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PrivacyScreen();
                      },
                    ));
                  },
                ),
                _SettingsButton(
                  title: 'Terms of Use',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TermsScreen();
                      },
                    ));
                  },
                ),
                _SettingsButton(
                  title: 'Rate Us',
                  onPressed: () {},
                ),
                _SettingsButton(
                  title: 'Share App',
                  onPressed: () {},
                ),
                _SettingsButton(
                  title: 'Clear Data',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return _ClearDialog();
                      },
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

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Button(
        onPressed: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: AppFonts.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ClearDialog extends StatelessWidget {
  const _ClearDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: SizedBox(
          width: 270,
          height: 138,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Clear Data',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: AppFonts.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Are you sure? All saved data will be cleared. Please, confirm your action.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: AppFonts.bold,
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 0.5,
                color: Color(0xff3C3C43).withValues(alpha: 0.36),
              ),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      onPressed: () {
                        context.read<CoinsBloc>().add(ClearCoins());
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OnboardScreen();
                            },
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Clear Data',
                        style: TextStyle(
                          color: Color(0xff007AFF),
                          fontSize: 17,
                          fontFamily: AppFonts.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 44,
                    color: Color(0xff3C3C43).withValues(alpha: 0.36),
                  ),
                  Expanded(
                    child: Button(
                      onPressed: Navigator.of(context).pop,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xff007AFF),
                          fontSize: 17,
                          fontFamily: AppFonts.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
