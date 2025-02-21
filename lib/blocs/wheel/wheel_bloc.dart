import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/coins_repository.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  final CoinsRepository _repository;
  double turns = 0.0;
  int amount = 3;

  WheelBloc({required CoinsRepository repository})
      : _repository = repository,
        super(WheelInitial()) {
    on<StartWheel>((event, emit) async {
      List<double> angles = [
        0.1, // 150
        0.2, // 180
        0.3, // 250
        0.4, // 400
        0.55, // 500
        0.7, // 10
        0.8, // 20
        0.9, // 100
      ];

      Random random = Random();
      int randomIndex = random.nextInt(angles.length);
      double angle = angles[randomIndex];

      turns += 6;
      amount--;

      await _repository.saveAmount(amount);

      emit(WheelStopped(
        turns: turns + angle,
        amount: amount,
      ));

      await Future.delayed(Duration(seconds: 13), () {
        int coins = 0;
        if (angle == 0.1) coins = 150;
        if (angle == 0.2) coins = 180;
        if (angle == 0.3) coins = 250;
        if (angle == 0.4) coins = 400;
        if (angle == 0.55) coins = 500;
        if (angle == 0.7) coins = 10;
        if (angle == 0.8) coins = 20;
        if (angle == 0.9) coins = 100;

        emit(WheelDialog(coins: coins));

        emit(WheelStopped(
          turns: turns + angle,
          amount: amount,
          canSpin: true,
        ));
      });
    });

    on<CheckAmount>((event, emit) {
      amount = _repository.getAmount();
      emit(WheelStopped(
        turns: turns,
        amount: amount,
        canSpin: true,
      ));
    });
  }
}
