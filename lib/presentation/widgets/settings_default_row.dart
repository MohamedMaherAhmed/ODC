import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import 'package:sizer/sizer.dart';
import 'default_text.dart';

class SettingsRow extends StatefulWidget {
  const SettingsRow({Key? key, required this.settingsRouteName})
      : super(key: key);
  final String settingsRouteName;

  @override
  State<SettingsRow> createState() => _SettingsRowState();
}

class _SettingsRowState extends State<SettingsRow> {
  dynamic navigateSettingsPages() async {
    switch (widget.settingsRouteName) {
      case "FAQ":
        return Navigator.pushNamed(context, widget.settingsRouteName);
      case "Terms & Conditions":
        return Navigator.pushNamed(context, widget.settingsRouteName);
      case "Our Partners":
        return Navigator.pushNamed(context, widget.settingsRouteName);
      case "Support":
        return Navigator.pushNamed(context, widget.settingsRouteName);
      case "Log Out":
        return showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: DefaultText(
                  text: "Logout",
                  fontSize: 20.sp,
                ),
                content: DefaultText(
                  text: "Are you sure?",
                  color: AppColors.black,
                  fontSize: 20.sp,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                actions: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(30.w, 5.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(30.w, 5.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () async {
                        CacheHelper.put(key: "loggedIn", value: false);
                        Navigator.pushNamedAndRemoveUntil(
                            context, "LoginScreen", (route) => false);
                      },
                      child: const Text("Sure")),
                ],
              );
            });
      default:
        print("Settings UI Error");
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => navigateSettingsPages(),
        child: Card(
          color: AppColors.transparent,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                text: widget.settingsRouteName,
                color: AppColors.black,
                fontSize: 20.sp,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.grey,
                size: 15,
              )
            ],
          ),
        ));
  }
}
