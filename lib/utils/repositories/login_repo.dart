

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo{
  static var auth=FirebaseAuth.instance;
  static var store=FirebaseFirestore.instance;
  static Future<bool> login({required String email,required String password})async{
    try{
      var res=await auth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user!=null){
        return true;
      }
      throw FirebaseAuthException(code: "NOT_EXIST",message: "user may have been deleted");
    }catch(e){
      rethrow;
    }

  }

}