import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/utils/repositories/login_repo.dart';
import 'package:pokedex/utils/repositories/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  signup(String email,String pass)async{
    try{
      emit(SignupLoading());
      var res=await SignupRepo.signup(email: email, password: pass);
      if(res) {
        emit(SignupSuccess());
      }else{
        throw Exception("Login Failed");
      }
    }catch(e){
      if(e is FirebaseAuthException){
        emit(SignupError(err: e.message.toString()));
      }else{
        emit(SignupError(err: e.toString()));
      }
    }
  }

}
