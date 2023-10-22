import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/cubits/signin_cubit/signin_cubit.dart';
import 'package:pokedex/cubits/signup_cubit/signup_cubit.dart';
import 'package:pokedex/views/screens/root_screen/pages/home_screen.dart';
import 'package:pokedex/views/screens/root_screen/root_screen.dart';
import 'package:pokedex/views/screens/signup_screen.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  final txtEmail = TextEditingController();

  final txtPass = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.sp),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            // Note: Same code is applied for the TextFormField as well
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: TextFormField(
                validator: (value){
                  if (value==null)
                  {
                    return "field cannot be empty";
                  }
                },
                controller: txtEmail,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1, //<-- SEE HERE
                      color: Color(0xffACACAC),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.sp),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            // Note: Same code is applied for the TextFormField as well
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: TextFormField(
                validator: (value){
                  if (value==null)
                    {
                      return "field cannot be empty";
                    }
                },
                controller: txtPass,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1, //<-- SEE HERE
                      color: Color(0xffACACAC),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),



            BlocListener<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SignupError) {
                  showDialog(
                    context: context,
                    builder: (context) =>  AlertDialog(
                      content: SizedBox(
                        height: 100.h,
                        child:const  Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  );
                }

                // TODO: implement listener
                if(state is SigninSuccess){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context)=>RootScreen()),
                          (route) => false);
                }
                if(state is SigninFailed){
                  //Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.err),
                    backgroundColor: Colors.red,
                  ));
                  log(state.err);
                }
              },
              child: GestureDetector(
                onTap: () {
                  if(_formkey.currentState!.validate())
                    {
                      context.read<SigninCubit>().login(txtEmail.text, txtPass.text);
                    }


                },
                child: Container(
                  height: 40.sp,
                  width: 272.sp,
                  decoration: BoxDecoration(
                    //gradient: Constants.gradient,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              },
              child: Container(
                height: 40.sp,
                width: 272.sp,
                decoration: BoxDecoration(
                  //gradient: Constants.gradient,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.sp)),
                child: const Center(
                  child: Text(
                    "Signup",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
