part of 'coins_bloc.dart';

@immutable
sealed class CoinsState {}

final class CoinsInitial extends CoinsState {}

final class CoinsLoaded extends CoinsState {
  CoinsLoaded({required this.coins});
  final int coins;
}
