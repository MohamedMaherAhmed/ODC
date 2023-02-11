import 'package:flutter/material.dart';

import '../../constants/app_colors/appColors.dart';

class DefaultLeadingIconBtn extends StatefulWidget {
  const DefaultLeadingIconBtn({Key? key}) : super(key: key);

  @override
  _DefaultLeadingIconBtnState createState() => _DefaultLeadingIconBtnState();
}

class _DefaultLeadingIconBtnState extends State<DefaultLeadingIconBtn> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryColor,
      ),
    );
  }
}
