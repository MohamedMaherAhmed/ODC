import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/auth/login/login_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:odc/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return BlocBuilder<LoginCubit, LoginState>(builder: (_, state) {
      return Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 15.h,
                  fit: BoxFit.cover,
                  width: 100.w,
                ),
                DefaultText(
                  text: "Login",
                  fontSize: 20.sp,
                  color: AppColors.black,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultTextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Please Enter your Email";
                      } else {
                        return null;
                      }
                    },
                    controller: loginCubit.loginEmailController,
                    hintAndLabelText: "E-mail",
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Please Enter your Password";
                      } else {
                        return null;
                      }
                    },
                    controller: loginCubit.loginPasswordController,
                    hintAndLabelText: "Password",
                    textInputType: TextInputType.visiblePassword),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {
                        ///TODO: Forgot Password Screen Navigation and Creation
                      },
                      child: DefaultText(
                        text: "Forgot Password?",
                        color: AppColors.primaryColor,
                        fontSize: 15.sp,
                        textDecoration: TextDecoration.underline,
                      )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(1.w, 7.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      CacheHelper.put(key: "loggedIn", value: true);
                      loginCubit.postLogin(context);
                    },
                    child: const DefaultText(
                      text: "Login",
                      fontSize: 25,
                      color: AppColors.white,
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
