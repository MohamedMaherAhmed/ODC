import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/default_app_bar_icon_btn.dart';
import '../../../widgets/default_text.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(
          text: "Our Partners",
          color: AppColors.black,
          fontSize: 20.sp,
        ),
        leading: DefaultLeadingIconBtn(),
        elevation: 2,
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 15.sp, top: 35.sp, end: 10.sp, bottom: 2.sp),
        child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            height: 50.h,
            width: 120.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  AppColors.grey,
                  AppColors.grey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 85.sp,
                  left: 5.sp,
                  right: 50.sp,
                  top: 10.sp,
                  child: DefaultText(
                    text: 'ODC',
                    color: AppColors.white,
                    fontSize: 30.sp,
                  ),
                ),
                Positioned(
                  bottom: 40.sp,
                  top: 40.sp,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 10.h,
                    fit: BoxFit.cover,
                    width: 95.w,
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
