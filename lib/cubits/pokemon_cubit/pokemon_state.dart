part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}
class PokemonLoading extends PokemonState {}
class PokemonLoaded extends PokemonState {}
class PokemonError extends PokemonState {
  String err;
  PokemonError({required this.err});
}
