import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants/end_point/end_points.dart';
import '../../../data/data_provider/remote/dio_helper.dart';
import '../../../data/models/login_data/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  bool loginVisiblePassword = false;

  // fun to change password visibility
  void changePasswordVisibility() {
    loginVisiblePassword = !loginVisiblePassword;
    emit(LoginVisiblePasswordState());
  }

  Future postLogin(context) async {
    var json = {
      "email": loginEmailController.value.text,
      "password": loginPasswordController.value.text,
    };
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: json).then((value) {
      if (value.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Successfully Logged In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(GetLoginSuccessState(loginModel: LoginModel.fromJson( json: value.data)));
        Navigator.pushNamedAndRemoveUntil(
            context, "AppLayout", (route) => false);
      }
    }).catchError((e) {
      print(e.toString());
      emit(GetLoginErrorState());
    });
  }
}
