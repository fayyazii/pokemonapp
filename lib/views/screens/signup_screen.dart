import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/cubits/signup_cubit/signup_cubit.dart';
import 'package:pokedex/views/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final txtEmail=TextEditingController();
  final txtPass=TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup"),),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.only(left: 22.sp),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Name", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),),
              ),
            ),
            SizedBox(height: 8.sp,),
            // Note: Same code is applied for the TextFormField as well
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: TextFormField(
                validator: (value){
                  if (value==null ||  value.isEmpty)
                  {
                    return "field cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter Name",
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.only(left: 22.sp),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),),
              ),
            ),
            SizedBox(height: 8.sp,),
            // Note: Same code is applied for the TextFormField as well
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: TextFormField(
                validator: (value){
                  if (value==null ||  value.isEmpty)
                  {
                    return "field cannot be empty";
                  }
                },
                controller: txtEmail,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.only(left: 22.sp),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Password", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),),
              ),
            ),
            SizedBox(height: 8.sp,),
            // Note: Same code is applied for the TextFormField as well
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: TextFormField(
                validator: (value){
                  if (value==null ||  value.isEmpty)
                  {
                    return "field cannot be empty";
                  }
                },
                controller: txtPass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                ),
              ),
            ),
            SizedBox(height: 20.sp,),

            BlocListener<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
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
                if(state is SignupError){
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.err),
                    backgroundColor: Colors.red,
                  ));

                }
                if(state is SignupSuccess){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context)=>LoginScreeen()),
                          (route) => false);
                }
              },
              child: GestureDetector(
                onTap: () {
                  if(_formkey.currentState!.validate())
                    {
                      context.read<SignupCubit>().signup(txtEmail.text, txtPass.text);
                    }

                },
                child: Container(
                  height: 40.sp,
                  width: 272.sp,

                  decoration: BoxDecoration(
                    //gradient: Constants.gradient,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.sp)
                  ),
                  child: const Center(
                    child: Text("Signup",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white
                      ),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            Container(
              height: 40.sp,
              width: 272.sp,

              decoration: BoxDecoration(
                //gradient: Constants.gradient,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.sp)
              ),
              child: const Center(
                child: Text("Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white
                  ),),
              ),
            ),
            SizedBox(height: 20.sp,),


          ],
        ),
      ),
    );
  }
}
