
import 'package:hive/hive.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/utils/hive_utils/hive_manager.dart';

class FavoriteRepo{

  static Future<List<Result>> getFavorites()async{
    return HiveManager.getFavorites();
  }
}