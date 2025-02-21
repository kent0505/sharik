part of 'wheel_bloc.dart';

@immutable
sealed class WheelEvent {}

class StartWheel extends WheelEvent {}

class CheckAmount extends WheelEvent {}
