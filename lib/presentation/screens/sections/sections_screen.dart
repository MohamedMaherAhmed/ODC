import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors/appColors.dart';
import '../../widgets/default_text.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 2,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: DefaultText(
          text: "Sections",
          color: AppColors.black,
          fontSize: 20.sp,
        ),
      ),
      body: Center(
        child: DefaultText(
          text: "No Sections",
          color: AppColors.black,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
