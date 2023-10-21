import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());
  getpokemon()async
  {
    try
        {

        }
        catch(e)
    {
      if(e is SocketException)
        {
          emit(PokemonError(err: e.message.toString()));
        }
      if(e is SocketException)
      {
        emit(PokemonError(err: e.message.toString()));
      }
      else
        {

            emit(PokemonError(err: e.toString()));

        }
    }
  }
}
