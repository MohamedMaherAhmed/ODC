import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/constants/constants.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_text.dart';

//This screen is details of note
class DetailsOfNoteScreen extends StatelessWidget {
  String? description;
  String? title;
  var date;

  DetailsOfNoteScreen({
    required this.description,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_rounded,
                color: AppColors.primaryColor, size: 30.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListView(
            children: [
              //Title
              SizedBox(height: 10.sp),
              Container(
                margin: EdgeInsets.only(left: 30.sp),
                child: DefaultText(
                  text: '$title',
                  color: AppColors.black,
                  fontSize: titleInfoFont,
                ),
              ),
              SizedBox(height: 5.sp),
              //Date
              Container(
                margin: EdgeInsets.only(left: 30.sp),
                child: DefaultText(
                  text: '$date',
                  color: AppColors.black,
                  fontSize: dateFont,
                ),
              ),
              SizedBox(height: 20.sp),
              //Description
              Container(
                margin: EdgeInsets.only(left: 30.sp),
                child: Text("${description}",
                    style: TextStyle(
                      fontSize: subtitleInfoFont,
                    )),
              ),
            ],
          ),
        ));
  }
}
