

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepo{
  static var auth=FirebaseAuth.instance;
  static var store=FirebaseFirestore.instance;
  static Future<bool> signup({required String email,required String password})async{
    try{
      var res=await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(res.user!=null){
        return true;
      }
      throw Exception("failed to signup");
    }catch(e){
      rethrow;
    }

  }

}