import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 10.h,
            fit: BoxFit.cover,
            width: 100.w,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(8.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const BouncingScrollPhysics(),
              children: List.generate(choices.length, (index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, choices[index].routeName as String);
                    },
                    child: SelectCard(
                      choice: choices[index],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon, this.routeName});

  final String title;
  final Widget icon;
  final String? routeName;
}

List<Choice> choices = <Choice>[
  Choice(
    title: 'Lecture',
    icon: SvgPicture.asset("assets/icons/lecture.svg",
        fit: BoxFit.fill, height: 6.h, width: 8.w),
    routeName: "LecturesScreen",
  ),
  Choice(
    title: 'Sections',
    icon: SvgPicture.asset("assets/icons/sections.svg",
        color: AppColors.primaryColor,
        fit: BoxFit.fill,
        height: 6.h,
        width: 8.w),
    routeName: "SectionsScreen",
  ),
  Choice(
    title: 'Midterms',
    icon: SvgPicture.asset("assets/icons/midterm.svg",
        fit: BoxFit.fill, height: 6.h, width: 8.w),
    routeName: "MidtermsScreen",
  ),
  Choice(
    title: 'Finals',
    icon: SvgPicture.asset("assets/icons/final.svg",
        fit: BoxFit.fill, height: 6.h, width: 8.w),
    routeName: "FinalsScreen",
  ),
  Choice(
    title: 'Events',
    icon: SvgPicture.asset("assets/icons/event.svg",
        fit: BoxFit.fill, height: 6.h, width: 8.w),
    routeName: "EventsScreen",
  ),
  Choice(
    title: 'Notes',
    icon: SvgPicture.asset("assets/icons/notes.svg",
        fit: BoxFit.fill, height: 6.h, width: 8.w),
    routeName: "NotesScreen",
  )
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.greyishBlue.withOpacity(0.3),
                  child: choice.icon,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DefaultText(
                  text: choice.title,
                  color: AppColors.primaryColor,
                  fontSize: 20,
                )
              ]),
        ));
  }
}
