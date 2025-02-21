import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';

abstract interface class CoinsRepository {
  const CoinsRepository();
  int getCoins();
  int getAmount();
  List<String> getScores();
  Future<void> clearCoins();
  Future<void> saveCoins(int coins);
  Future<void> saveAmount(int amount);
  Future<void> saveScore(int coins);
}

final class CoinsRepositoryImpl implements CoinsRepository {
  CoinsRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  int getCoins() {
    return _prefs.getInt(Keys.coins) ?? 0;
  }

  @override
  int getAmount() {
    int amount = _prefs.getInt(Keys.wheelAmount) ?? 3;
    int lastUsed = _prefs.getInt(Keys.lastUsed) ?? 0;
    DateTime now = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch ~/ 1000 * 1000,
    );
    DateTime last = DateTime.fromMillisecondsSinceEpoch(lastUsed * 1000);
    return now.day == last.day && now.year == last.year ? amount : 3;
  }

  @override
  List<String> getScores() {
    return _prefs.getStringList(Keys.scores) ?? [];
  }

  @override
  Future<void> clearCoins() async {
    await _prefs.clear();
  }

  @override
  Future<void> saveCoins(int coins) async {
    await _prefs.setInt(Keys.coins, coins);
  }

  @override
  Future<void> saveAmount(int amount) async {
    await _prefs.setInt(Keys.wheelAmount, amount);
    await _prefs.setInt(
      Keys.lastUsed,
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
  }

  @override
  Future<void> saveScore(int coins) async {
    final scores = getScores();
    scores.insert(0, coins.toString());
    await _prefs.setStringList(Keys.scores, scores);
  }
}
