part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}
class FavoritesLoading extends FavoritesState {}
class FavoritesLoaded extends FavoritesState {
  List<Result> data;
  FavoritesLoaded({required this.data});
}
class FavoritesError extends FavoritesState {
  String err;
  FavoritesError({required this.err});
}
