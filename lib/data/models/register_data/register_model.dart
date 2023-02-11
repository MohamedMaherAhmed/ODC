

import 'package:odc/data/models/user_data/user_model.dart';

class RegisterModel {
  String? code;
  String? message;
  List<UserData> listUserData = [];

  RegisterModel.fromJson({required Map<String,dynamic> json}){
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element){
      UserData item = UserData.fromJson(json: element);
      listUserData.add(item);
    });
  }

  /*Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'data': listUserData.forEach((element) {
        UserData.fromJson(json: element.toMap());
      }),
    };
  }*/


}