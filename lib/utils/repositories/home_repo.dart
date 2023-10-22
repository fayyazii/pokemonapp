import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/utils/api_manager/api_manager.dart';

class HomeRepo
{
  static Future<PokeModel> fetchItems()async{
    var client=http.Client();
    var uri=Uri.parse(ApiManager.pokeCountAndList);
    try {
      var res = await client.get(uri);
      if (res.statusCode == 200) {
        return pokeModelFromJson(res.body);
      } else {
        throw HttpException(res.reasonPhrase ?? "Unknown error occurred");
      }
    }catch(e){
      rethrow;
    }
  }
}