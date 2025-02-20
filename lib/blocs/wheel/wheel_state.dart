part of 'wheel_bloc.dart';

@immutable
sealed class WheelState {}

final class WheelInitial extends WheelState {}

final class WheelStopped extends WheelState {
  WheelStopped({
    required this.turns,
    this.amount = 0,
    this.canSpin = false,
  });

  final double turns;
  final int amount;
  final bool canSpin;
}
