part of 'wheel_bloc.dart';

@immutable
sealed class WheelState {}

final class WheelInitial extends WheelState {}

final class WheelStopped extends WheelState {
  WheelStopped({
    required this.turns,
    required this.amount,
    this.canSpin = false,
  });

  final double turns;
  final int amount;
  final bool canSpin;
}

final class WheelDialog extends WheelState {
  WheelDialog({required this.coins});
  final int coins;
}
