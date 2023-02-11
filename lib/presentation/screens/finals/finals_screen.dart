import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors/appColors.dart';
import '../../widgets/default_app_bar_icon_btn.dart';
import '../../widgets/default_text.dart';

class FinalsScreen extends StatelessWidget {
  const FinalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultLeadingIconBtn(),
        elevation: 2,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: DefaultText(
          text: "Finals",
          color: AppColors.black,
          fontSize: 20.sp,
        ),
      ),
      body: Center(
        child: DefaultText(
          text: "No Finals",
          color: AppColors.black,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
