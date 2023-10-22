

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/utils/constants/contants.dart';

class HiveManager{
  static late Box hiveDb;
  static Future<void> init()async{
    Directory directory = await getApplicationDocumentsDirectory();
     Hive.init(directory.path);
    hiveDb=await Hive.openBox(favoriteDb);
  }
  static void addToFavorite(Result model){
    hiveDb.add(jsonEncode(model.toJson()));
  }
  static void removeFavorite(int index){
    hiveDb.deleteAt(index);
  }
  static List<Result> getFavorites(){
    var list=hiveDb.values;
    var res=List<Result>.from(list.map((x) => Result.fromJson(jsonDecode(x.toString()))));
    return res;
  }

  static bool isFavorite(String url){
    var favorites=getFavorites();
    bool isFav=false;
    for (var element in favorites) {
      if(element.url==url)
        {
          isFav=true;
          break;
        }
    }
    return isFav;
  }

}