import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';
import '../core/utils.dart';

abstract interface class CoinsRepository {
  const CoinsRepository();

  int getCoins();

  Future<void> saveCoins(int coins);

  Future<void> clearCoins();

  int getAmount();

  Future<void> saveAmount(int amount);
}

final class CoinsRepositoryImpl implements CoinsRepository {
  CoinsRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  int getCoins() {
    logger('GET COINS');
    return _prefs.getInt(Keys.coins) ?? 0;
  }

  @override
  Future<void> saveCoins(int coins) async {
    logger('SAVE COINS');
    await _prefs.setInt(Keys.coins, coins);
  }

  @override
  Future<void> clearCoins() async {
    logger('CLEAR COINS');
    await _prefs.clear();
  }

  @override
  int getAmount() {
    logger('GET AMOUNT');
    int amount = _prefs.getInt(Keys.wheelAmount) ?? 3;
    int lastUsed = _prefs.getInt(Keys.lastUsed) ?? 0;
    DateTime now = DateTime.fromMillisecondsSinceEpoch(getTimestamp() * 1000);
    DateTime last = DateTime.fromMillisecondsSinceEpoch(lastUsed * 1000);
    return now.day == last.day && now.year == last.year ? amount : 3;
  }

  @override
  Future<void> saveAmount(int amount) async {
    logger('SAVE AMOUNT');
    await _prefs.setInt(Keys.wheelAmount, amount);
    await _prefs.setInt(Keys.lastUsed, getTimestamp());
  }
}
