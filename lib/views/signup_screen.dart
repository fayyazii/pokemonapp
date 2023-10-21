import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"),),
      body: Column(
        children: [
          SizedBox(height: 20.sp,),
          Padding(
            padding:  EdgeInsets.only(left: 22.sp),
            child:  const Align(
              alignment: Alignment.centerLeft,
              child: Text("Name",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
            ),
          ),
          SizedBox(height: 8.sp,),
          // Note: Same code is applied for the TextFormField as well
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: TextField(

              decoration: InputDecoration(
                hintText: "Enter Name",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(
                    width: 1, //<-- SEE HERE
                    color: Color(0xffACACAC),),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.sp,),
          Padding(
            padding:  EdgeInsets.only(left: 22.sp),
            child:  const Align(
              alignment: Alignment.centerLeft,
              child: Text("Email",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
            ),
          ),
          SizedBox(height: 8.sp,),
          // Note: Same code is applied for the TextFormField as well
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: TextField(

              decoration: InputDecoration(
                hintText: "Enter Email",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(
                    width: 1, //<-- SEE HERE
                    color: Color(0xffACACAC),),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.sp,),
          Padding(
            padding:  EdgeInsets.only(left: 22.sp),
            child:  const Align(
              alignment: Alignment.centerLeft,
              child: Text("Password",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
            ),
          ),
          SizedBox(height: 8.sp,),
          // Note: Same code is applied for the TextFormField as well
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: TextField(

              decoration: InputDecoration(
                hintText: "Enter Password",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(
                    width: 1, //<-- SEE HERE
                    color: Color(0xffACACAC),),
                  borderRadius: BorderRadius.circular(50.0),
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
            child:  const Center(
              child: Text("Signup",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                ),),
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
            child:  const Center(
              child: Text("Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
