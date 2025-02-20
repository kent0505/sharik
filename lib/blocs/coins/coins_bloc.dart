import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/coins_repository.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final CoinsRepository _repository;

  CoinsBloc({required CoinsRepository repository})
      : _repository = repository,
        super(CoinsInitial()) {
    on<LoadCoins>((event, emit) {
      int coins = _repository.getCoins();
      emit(CoinsLoaded(coins: coins));
    });

    on<SaveCoins>((event, emit) async {
      int coins = _repository.getCoins();
      coins += event.amount;
      await _repository.saveCoins(coins);
      emit(CoinsLoaded(coins: coins));
    });
  }
}
