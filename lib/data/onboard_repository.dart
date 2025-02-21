import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';

abstract interface class OnboardRepository {
  const OnboardRepository();

  bool isOnBoard();

  Future<void> removeOnboard();

  Future<void> saveProfile(String nickname, String photo);
}

final class OnboardRepositoryImpl implements OnboardRepository {
  OnboardRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  bool isOnBoard() {
    return _prefs.getBool(Keys.onboard) ?? true;
  }

  @override
  Future<void> removeOnboard() async {
    await _prefs.setBool(Keys.onboard, false);
  }

  @override
  Future<void> saveProfile(String nickname, String photo) async {
    await _prefs.setString(Keys.nickname, nickname);
    await _prefs.setString(Keys.photo, photo);
  }
}
