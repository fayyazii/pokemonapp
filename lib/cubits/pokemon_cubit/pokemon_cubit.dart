import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/utils/repositories/home_repo.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  getPokemon() async {
    try {
      emit(PokemonLoading());
      var model = await HomeRepo.fetchItems();
      emit(PokemonLoaded(model: model));
    } catch (e) {
      if (e is SocketException) {
        emit(PokemonError(
            err:
                "unable to connect to the server, please check your internet and try again"));
      } else if (e is HttpException) {
        emit(PokemonError(err: e.message.toString()));
      } else {
        emit(PokemonError(err: e.toString()));
      }
    }
  }
}
