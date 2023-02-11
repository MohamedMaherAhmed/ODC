import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/settings_default_row.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final List<String> settingsPageRouteNames = [
    "FAQ",
    "Terms & Conditions",
    "Our Partners",
    "Support",
    "Log Out",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        title: DefaultText(
          text: "Settings",
          color: AppColors.black,
          fontSize: 20.sp,
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsetsDirectional.all(15),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: settingsPageRouteNames.length,
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 15,end: 5, start: 5, top: 15),
              child: SettingsRow(
                  settingsRouteName: settingsPageRouteNames[index]),
            );
          }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,height: 1,indent: 5,)),
    );
  }
}
