import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';

abstract interface class OnboardRepository {
  const OnboardRepository();

  bool isOnBoard();

  Future<void> removeOnboard();

  Future<void> saveProfile(String nickname, String photo);

  String getNickname();

  String getPhoto();
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
    await _prefs.setBool(Keys.onboard, false);
  }

  @override
  String getNickname() {
    return _prefs.getString(Keys.nickname) ?? 'User';
  }

  @override
  String getPhoto() {
    return _prefs.getString(Keys.photo) ?? Assets.profile1;
  }
}
