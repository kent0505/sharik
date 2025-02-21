import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/constants.dart';
import '../data/onboard_repository.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';
import '../widgets/text_stroke.dart';
import '../widgets/txt_field.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final photoController = TextEditingController();

  void onSkip() {
    context.read<OnboardRepository>().removeOnboard();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
      (route) => false,
    );
  }

  void onCreate() {
    context.read<OnboardRepository>().saveProfile(
          nameController.text,
          photoController.text,
        );
    onSkip();
  }

  @override
  void dispose() {
    nameController.dispose();
    photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16 + MediaQuery.of(context).viewPadding.top),
            Center(
              child: TextStroke(
                'Create Profile',
                fontSize: 24,
                fontFamily: AppFonts.lemon,
                strokeWidth: 4,
              ),
            ),
            SizedBox(height: 36),
            SvgWidget(Assets.profile1),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Your Nickname',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: AppFonts.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TxtField(
              controller: nameController,
              hintText: 'Nickname',
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Choose Your Avatar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: AppFonts.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Button(
                  onPressed: () {},
                  child: SvgWidget(Assets.add),
                ),
                SizedBox(width: 8),
                Button(
                  onPressed: () {},
                  child: SvgWidget(Assets.profile2),
                ),
                SizedBox(width: 8),
                Button(
                  onPressed: () {},
                  child: SvgWidget(Assets.profile3),
                ),
              ],
            ),
            Spacer(),
            MainButton(
              title: 'Create',
              active: false,
              onPressed: onCreate,
            ),
            Button(
              onPressed: onSkip,
              minSize: 72,
              child: Center(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: AppFonts.lemon,
                  ),
                ),
              ),
            ),
            SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
