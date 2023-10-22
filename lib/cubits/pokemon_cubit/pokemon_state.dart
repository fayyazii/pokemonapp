part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}
class PokemonLoading extends PokemonState {}
class PokemonLoaded extends PokemonState {
  PokeModel model;
  PokemonLoaded({required  this.model});
}
class PokemonError extends PokemonState {
  String err;
  PokemonError({required this.err});
}
