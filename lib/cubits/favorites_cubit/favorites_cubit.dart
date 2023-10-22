import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/utils/hive_utils/hive_manager.dart';
import 'package:pokedex/utils/repositories/favorite_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  
  loadFavorites()async{
    try{
      emit(FavoritesLoading());
      var res=await FavoriteRepo.getFavorites();
      emit(FavoritesLoaded(data:res));
    }catch(e){
      emit(FavoritesError(err: e.toString()));
    }
  }

  addToFav(Result result)async{
     HiveManager.addToFavorite(result);
     loadFavorites();
  }

  removeFavorite(int index)async{
    HiveManager.removeFavorite(index);
    loadFavorites();
  }
}
