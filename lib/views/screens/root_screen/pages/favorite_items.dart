import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:pokedex/cubits/favorites_cubit/favorites_cubit.dart';

class FavoriteItems extends StatefulWidget {
  const FavoriteItems({Key? key}) : super(key: key);

  @override
  State<FavoriteItems> createState() => _FavoriteItemsState();
}

class _FavoriteItemsState extends State<FavoriteItems> {

  @override
  void initState() {
    context.read<FavoritesCubit>().loadFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavoritesError) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Center(
                child: Text(state.err,style: TextStyle(color: Colors.red),),
              ),
            );
          }
          if (state is FavoritesLoaded) {
            return state.data.isEmpty?
               const  Center(
                  child: Text("No Items in Favorites",style: TextStyle(color: Colors.grey),),
                )
                :ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Center(
                      child: Text(
                        state.data[index].name.characters.first.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text(
                    state.data[index].name,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    state.data[index].url,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing:IconButton(
                    icon:  Icon(Icons.delete,size: 20.sp,),
                    onPressed: (){
                      context.read<FavoritesCubit>().removeFavorite(index);
                    },
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
