

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo{
  static var auth=FirebaseAuth.instance;
  static var store=FirebaseFirestore.instance;
  static Future<bool> login({required String email,required String password})async{
    try{
      var res=await auth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user!=null){
        var data=await store.collection("users").doc(res.user!.uid).get();
        return true;
      }
      throw FirebaseAuthException(code: "NOT_EXIST",message: "user may have been deleted");
    }catch(e){
      rethrow;
    }

  }

}