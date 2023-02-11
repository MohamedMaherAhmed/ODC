import 'package:odc/data/data_provider/local/cache_helper.dart';

class LoginModel{
  String? email;
  String? password;
  String? accessToken;

  LoginModel.fromJson({required Map <String, dynamic> json}){
    email = json['email'];
    password = json['password'];
    accessToken = json['data']['accessToken'];
    CacheHelper.init();
    CacheHelper.put(key: "token", value: accessToken);
  }



}