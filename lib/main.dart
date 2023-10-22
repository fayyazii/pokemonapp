import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:pokedex/cubits/pokemon_cubit/pokemon_cubit.dart';
import 'package:pokedex/cubits/signin_cubit/signin_cubit.dart';
import 'package:pokedex/cubits/signup_cubit/signup_cubit.dart';
import 'package:pokedex/views/screens/root_screen/pages/favorite_items.dart';
import 'package:pokedex/views/screens/login_screen.dart';
import 'package:pokedex/views/screens/root_screen/root_screen.dart';
import 'package:pokedex/views/screens/signup_screen.dart';
import 'package:pokedex/views/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>PokemonCubit()),
            BlocProvider(create: (context)=>SigninCubit()),
            BlocProvider(create: (context)=>SignupCubit()),
            BlocProvider(create: (context)=>FavoritesCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
            ),
            home: child,
          ),
        );
      },
      child:  const SplashScreen(),
    );
  }
}

