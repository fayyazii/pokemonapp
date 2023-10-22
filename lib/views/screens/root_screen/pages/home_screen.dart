import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:pokedex/cubits/pokemon_cubit/pokemon_cubit.dart';
import 'package:pokedex/utils/hive_utils/hive_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PokemonCubit>().getPokemon();
    super.initState();
  }
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    await HiveManager.init();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if(state is PokemonLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PokemonError){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Center(
                child: Text(state.err,style: const TextStyle(color: Colors.black),textAlign: TextAlign.center,),
              ),
            );
          }
          if(state is PokemonLoaded) {
            var results=state.model.results;

            return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) =>
             Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Center(
                    child: Text(results[index].name.characters.first.toUpperCase(), style: TextStyle(color: Colors.white),),
                  ),
                ),
                title: Text(results[index].name, style: TextStyle(color: Colors.black),),
                subtitle: Text(results[index].url,style: TextStyle(color: Colors.grey),),
                trailing:IconButton(
                  icon: Icon(HiveManager.isFavorite(results[index].url)?Icons.favorite :Icons.favorite_border,size: 25.sp,color: Colors.red,),
                  onPressed: (){
                   var isFav= HiveManager.isFavorite(results[index].url);
                    if(!isFav){
                      context.read<FavoritesCubit>().addToFav(
                          state.model.results[index]);
                    }else {
                      context.read<FavoritesCubit>().removeFavorite(index);
                    }
                    setState(() {

                    });
                  },
                ),
              ),
            ),
          );
          }
          else return SizedBox.shrink();
        },
      ),
    );
  }
}
