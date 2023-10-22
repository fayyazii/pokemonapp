part of 'signin_cubit.dart';


abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninLoading extends SigninState {}
class SigninSuccess extends SigninState {}
class SigninFailed extends SigninState {
  String err;
  SigninFailed({required this.err});
}
