import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
  String asset = Assets.profile1;

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  Future<XFile> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return XFile('');
      return image;
    } catch (e) {
      return XFile('');
    }
  }

  void onGallery() async {
    Navigator.pop(context);
    image = await pickImage(ImageSource.gallery);
    if (image.path.isNotEmpty) {
      photoController.text = image.path;
      setState(() {});
    }
  }

  void onCamera() async {
    Navigator.pop(context);
    image = await pickImage(ImageSource.camera);
    if (image.path.isNotEmpty) {
      photoController.text = image.path;
      setState(() {});
    }
  }

  void onSkip() {
    showDialog(
      context: context,
      builder: (context) {
        return _SkipDialog();
      },
    );
  }

  void onCreate() {
    context.read<OnboardRepository>().saveProfile(
          nameController.text,
          photoController.text,
        );
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
            ClipRRect(
              borderRadius: BorderRadius.circular(111),
              child: Image.file(
                File(photoController.text),
                height: 111,
                width: 111,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SvgWidget(
                    asset,
                    width: 111,
                  );
                },
              ),
            ),
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
              onChanged: (value) {
                setState(() {});
              },
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return _UploadDialog(
                          onGallery: onGallery,
                          onCamera: onCamera,
                        );
                      },
                    );
                  },
                  child: SvgWidget(Assets.add),
                ),
                SizedBox(width: 8),
                Button(
                  onPressed: () {
                    setState(() {
                      asset = Assets.profile2;
                      photoController.text = asset;
                    });
                  },
                  child: SvgWidget(Assets.profile2),
                ),
                SizedBox(width: 8),
                Button(
                  onPressed: () {
                    setState(() {
                      asset = Assets.profile3;
                      photoController.text = asset;
                    });
                  },
                  child: SvgWidget(Assets.profile3),
                ),
              ],
            ),
            Spacer(),
            MainButton(
              title: 'Create',
              active: nameController.text.isNotEmpty &&
                  photoController.text.isNotEmpty,
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

class _SkipDialog extends StatelessWidget {
  const _SkipDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 212,
        width: 358,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: AppColors.accent,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Skip this Step?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.bold,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Are you sure you want to skip this step and continue without keeping the entered information?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: AppFonts.medium,
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                SizedBox(width: 16),
                Expanded(
                  child: Button(
                    onPressed: Navigator.of(context).pop,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: AppFonts.lemon,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: MainButton(
                    title: 'Skip',
                    onPressed: () {
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
                    },
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _UploadDialog extends StatelessWidget {
  const _UploadDialog({
    required this.onGallery,
    required this.onCamera,
  });

  final VoidCallback onGallery;
  final VoidCallback onCamera;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 332,
        width: 358,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: AppColors.accent,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Upload Photo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Add a photo to complete your profile setup.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: AppFonts.medium,
              ),
            ),
            SizedBox(height: 16),
            MainButton(
              title: 'Phone Gallery',
              onPressed: onGallery,
            ),
            SizedBox(height: 12),
            MainButton(
              title: 'Camera',
              onPressed: onCamera,
            ),
            SizedBox(height: 11),
            Button(
              onPressed: Navigator.of(context).pop,
              minSize: 72,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: AppFonts.lemon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
