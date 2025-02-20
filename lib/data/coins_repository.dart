import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';
import '../core/utils.dart';

abstract interface class CoinsRepository {
  const CoinsRepository();

  int getCoins();

  Future<void> saveCoins(int amount);
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
    await _prefs.setInt(Keys.coins, amount);
    logger('SAVE COINS');
  }
}
