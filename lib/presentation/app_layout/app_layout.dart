import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc/presentation/screens/home/home_screen.dart';
import 'package:odc/presentation/screens/settings/settings_screen.dart';
import '../screens/news/news_screen.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import '../../constants/app_colors/appColors.dart';


class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;

  final List _screens = [
    const HomeScreen(),
    const NewsScreen(),
     SettingsScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            title: const DefaultText(text: "Home"),
            activeColor: AppColors.primaryColor,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.newspaper_outlined),
            title: const DefaultText(text: "News"),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/icons/settings.svg"),
            title: const DefaultText(text: "Settings"),
            activeColor: AppColors.primaryColor,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
