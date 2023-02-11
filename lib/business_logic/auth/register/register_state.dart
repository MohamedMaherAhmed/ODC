part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class GetRegisterSuccessState extends RegisterState {}
class GetRegisterErrorState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}

class ChangeGenderState extends RegisterState {}