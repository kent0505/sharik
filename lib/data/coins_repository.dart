import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';
import '../core/utils.dart';

abstract interface class CoinsRepository {
  const CoinsRepository();

  int getCoins();

  Future<void> saveCoins(int amount);

  Future<void> clearCoins();
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
  Future<void> saveCoins(int amount) async {
    logger('SAVE COINS');
    await _prefs.setInt(Keys.coins, amount);
  }

  @override
  Future<void> clearCoins() async {
    logger('CLEAR COINS');
    await _prefs.clear();
  }
}
