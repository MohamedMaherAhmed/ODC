import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc/constants/end_point/end_points.dart';
import 'package:odc/data/data_provider/remote/dio_exceptions.dart';
import 'package:odc/data/data_provider/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  String gender = 'm';
  String errorMsg = "";
  bool changed = false;

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  void changeGender(val) {
    changed = val;
    changed ? gender = 'm' : gender = 'f';
    emit(ChangeGenderState());
  }

  Future postRegister(context) async {
    var json = {
      'name': nameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "phoneNumber": phoneController.value.text,
      "gender": gender ,
    };

    print("Gender RegisterCubit: ${json}");

    DioHelper.postData(url: registerEndPoint, data: json).then((value) {
      print("start sending register data");
      if (value.statusCode == 200) {
        print("rejoice for they are sent");
        Fluttertoast.showToast(
            msg: "Successfully Signup",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushNamedAndRemoveUntil(
            context, "LoginScreen", (route) => false);
      }
      emit(GetRegisterSuccessState());
    }).catchError((e) {
      print("${DioExceptions.fromDioError(e)}");
      print(e.toString());
      emit(GetRegisterErrorState());
    });
  }
}
