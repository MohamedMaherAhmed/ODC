part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class GetLoginSuccessState extends LoginState {
  final LoginModel loginModel;

  GetLoginSuccessState({required this.loginModel});

}
class GetLoginErrorState extends LoginState {}
class LoginLoadingState extends LoginState {}

class LoginVisiblePasswordState extends LoginState {}
