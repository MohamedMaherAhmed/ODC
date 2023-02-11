class UserData {
  String? name;
  String? email;
  String? password;
  String? gender;
  String? phoneNumber;

  UserData.fromJson({required Map<String, dynamic> json}){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
  }

}