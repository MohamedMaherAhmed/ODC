import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/default_app_bar_icon_btn.dart';
import '../../../widgets/default_text.dart';

class Support extends StatelessWidget {
  Support({Key? key}) : super(key: key);

  final TextEditingController supportUiNameController = TextEditingController();
  final TextEditingController supportUiEmailController =
      TextEditingController();
  final TextEditingController supportUiDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultLeadingIconBtn(),
        elevation: 2,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: DefaultText(
          text: "Support",
          color: AppColors.black,
          fontSize: 20.sp,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(
            end: 15.sp, start: 15.sp, top: 15.sp, bottom: 1.sp),
        children: [
          DefaultTextFormField(
            controller: supportUiNameController,
            hintAndLabelText: "Name",
            textInputType: TextInputType.text,
            isFilled: true,
            textFormFieldPrefixIcon: const Icon(Icons.person),
          ),
          SizedBox(
            height: 3.h,
          ),
          DefaultTextFormField(
            controller: supportUiEmailController,
            hintAndLabelText: "E-Mail",
            textInputType: TextInputType.text,
            isFilled: true,
            textFormFieldPrefixIcon: const Icon(Icons.email,color: AppColors.primaryColor,),
          ),
          SizedBox(
            height: 3.h,
          ),
          DefaultTextFormField(
            controller: supportUiDescriptionController,
            hintAndLabelText: "Description",
            textInputType: TextInputType.text,
            isFilled: true,
          ),
          SizedBox(
            height: 5.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(10.w, 7.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const DefaultText(
                text: "Submit",
                fontSize: 25,
                color: AppColors.white,
              )),
        ],
      ),
    );
  }
}
