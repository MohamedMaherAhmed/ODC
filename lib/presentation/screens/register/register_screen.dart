import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/auth/register/register_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:odc/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    bool isPressed = false;

    @override
    Widget build(BuildContext context) {
      RegisterCubit registerCubit = RegisterCubit.get(context);
      return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
        registerCubit.changeGender(isPressed);
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Form(
                key: registerCubit.registerKey,
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
                      text: "Register",
                      color: AppColors.black,
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter your Name";
                          } else {
                            return null;
                          }
                        },
                        controller: registerCubit.nameController,
                        hintAndLabelText: "Name",
                        textInputType: TextInputType.text),
                    SizedBox(
                      height: 5.h,
                    ),
                    DefaultTextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter your E-mail";
                          } else {
                            return null;
                          }
                        },
                        controller: registerCubit.emailController,
                        hintAndLabelText: "E-mail",
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 5.h,
                    ),
                    DefaultTextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter your Password";
                          } else {
                            return null;
                          }
                        },
                        controller: registerCubit.passwordController,
                        hintAndLabelText: "Password",
                        textInputType: TextInputType.visiblePassword),
                    SizedBox(
                      height: 5.h,
                    ),
                    DefaultTextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter your Confirm Password";
                          } else {
                            return null;
                          }
                        },
                        controller: registerCubit.confirmPasswordController,
                        hintAndLabelText: "Confirm Password",
                        textInputType: TextInputType.visiblePassword),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter your Phone Number";
                          } else {
                            return null;
                          }
                        },
                        controller: registerCubit.phoneController,
                        hintAndLabelText: "Phone",
                        textInputType: TextInputType.phone),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const DefaultText(
                            text: "Gender", fontSize: 20, color: AppColors.black),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(0.w, 7.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              setState(() {
                                isPressed = !isPressed;
                              });
                            },
                            child: DefaultText(
                              text: registerCubit.gender.toUpperCase(),
                              fontSize: 30,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(1.w, 7.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            if (registerCubit.registerKey.currentState!
                                .validate()) {
                              registerCubit.postRegister(context);
                            }
                          },
                          child: const Text("Register")),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Divider(
                            height: 3.h,
                            color: AppColors.primaryColor,
                            endIndent: 2.w,
                            thickness: 1,
                          ),
                        ),
                        const DefaultText(
                          text: "OR",
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Divider(
                            height: 5.h,
                            color: AppColors.primaryColor,
                            indent: 2.h,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(1.w, 7.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "LoginScreen", (route) => false);
                          },
                          child: const Text("Login")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    }
}




