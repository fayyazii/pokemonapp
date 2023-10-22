import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/utils/repositories/login_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  login(String email,String pass)async{
    try{
      emit(SigninLoading());
      var res=await LoginRepo.login(email: email, password: pass);
      if(res) {
        emit(SigninSuccess());
      }else{
        throw Exception("Login Failed");
      }
    }catch(e){
      if(e is FirebaseAuthException){
        emit(SigninFailed(err: e.message.toString()));
      }else{
        emit(SigninFailed(err: e.toString()));
      }
    }
  }
}
