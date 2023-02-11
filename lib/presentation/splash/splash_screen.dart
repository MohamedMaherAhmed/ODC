import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/logo.png',
        height: 25.h,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        repeat: ImageRepeat.noRepeat,
        isAntiAlias: true,
      ),
      logoWidth: 75.w,
      showLoader: true,
      loaderColor: AppColors.primaryColor,
      loadingTextPadding:
          EdgeInsets.only(left: 20.sp, top: 5.sp, right: 5.sp, bottom: 15.sp),
      navigator: (CacheHelper.get(key: "loggedIn") == true)
          ? "AppLayout"
          : "RegisterScreen",
      durationInSeconds: 5,
    );
  }
}
