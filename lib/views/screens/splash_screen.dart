import 'package:flutter/material.dart';
import 'package:pokedex/views/screens/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatehome();
  }
  navigatehome()async
  {
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreeen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SplashScreen"),
      ),
      body: const Column(
        children: [
          SizedBox(height: 100,),
          Center(
            child: Text("Welcome to the application",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}