import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField(
      {Key? key,
      required this.controller,
      required this.hintAndLabelText,
      required this.textInputType,
      this.textFormFieldPrefixIcon,
      this.isFilled = false,
      this.validator})
      : super(key: key);

  final TextEditingController controller;
  final String hintAndLabelText;
  final TextInputType textInputType;
  final Widget? textFormFieldPrefixIcon;
  final bool isFilled;
  final String? Function(String?)? validator;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  Widget? passwordVisibilityIconButton;
  bool isPasswordObscure = true;

  bool getPassWordIconButton() {
    passwordVisibilityIconButton = IconButton(
        onPressed: () {
          setState(() {
            isPasswordObscure = !isPasswordObscure;
          });
        },
        icon: Icon(
          isPasswordObscure ? Icons.visibility : Icons.visibility_off,
          color: AppColors.primaryColor,
        ));
    return isPasswordObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.textInputType == TextInputType.visiblePassword
          ? getPassWordIconButton()
          : false,
      obscuringCharacter: "*",
      maxLines: widget.hintAndLabelText == "Description" ? null : 1,
      decoration: InputDecoration(
        labelText: widget.hintAndLabelText,
        labelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        hintStyle: TextStyle(
          color: AppColors.primaryColor.withOpacity(0.5),
        ),
        suffixIcon: passwordVisibilityIconButton,
        prefixIcon: widget.textFormFieldPrefixIcon,
        prefixIconColor: AppColors.primaryColor,
        hintText: widget.hintAndLabelText == "Description"
            ? "What's making you unhappy?"
            : widget.hintAndLabelText,
        fillColor: AppColors.grey,
        filled: widget.isFilled ? true : false,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
