part of 'coins_bloc.dart';

@immutable
sealed class CoinsEvent {}

final class LoadCoins extends CoinsEvent {}

final class SaveCoins extends CoinsEvent {
  SaveCoins({required this.amount});
  final int amount;
}

final class ClearCoins extends CoinsEvent {}
