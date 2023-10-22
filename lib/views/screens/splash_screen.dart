import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/utils/hive_utils/hive_manager.dart';
import 'package:pokedex/views/screens/login_screen.dart';
import 'package:pokedex/views/screens/root_screen/pages/home_screen.dart';
import 'package:pokedex/views/screens/root_screen/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FirebaseAuth.instance.currentUser != null
                  ? RootScreen()
                  : LoginScreeen()));
    });
    super.initState();
  }

  @override
  void didChangeDependencies() async{
    await HiveManager.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text(
          "Welcome to the application",
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
