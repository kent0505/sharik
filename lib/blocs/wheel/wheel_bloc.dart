import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  double turns = 0.0;

  WheelBloc() : super(WheelInitial()) {
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
      logger('WHEEL STARTED');
      emit(WheelStopped(turns: turns + angle));
      await Future.delayed(Duration(seconds: 13), () {
        logger('WHEEL STOPPED');
        int amount = 0;
        if (angle == 0.1) amount = 150;
        if (angle == 0.2) amount = 180;
        if (angle == 0.3) amount = 250;
        if (angle == 0.4) amount = 400;
        if (angle == 0.55) amount = 500;
        if (angle == 0.7) amount = 10;
        if (angle == 0.8) amount = 20;
        if (angle == 0.9) amount = 100;
        emit(WheelStopped(
          turns: turns + angle,
          amount: amount,
          canSpin: true,
        ));
      });
    });
  }
}
