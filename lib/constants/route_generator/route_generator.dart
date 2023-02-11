import 'package:flutter/material.dart';
import 'package:odc/presentation/app_layout/app_layout.dart';
import 'package:odc/presentation/screens/events/events_screen.dart';
import 'package:odc/presentation/screens/finals/finals_screen.dart';
import 'package:odc/presentation/screens/home/home_screen.dart';
import 'package:odc/presentation/screens/lectures/lectures_screen.dart';
import 'package:odc/presentation/screens/login/login_screen.dart';
import 'package:odc/presentation/screens/midterms/midterms_screen.dart';
import 'package:odc/presentation/screens/notes/notes_screen.dart';
import 'package:odc/presentation/screens/register/register_screen.dart';
import 'package:odc/presentation/screens/sections/sections_screen.dart';
import 'package:odc/presentation/screens/settings/faq/faq_screen.dart';
import 'package:odc/presentation/screens/settings/settings_screen.dart';
import 'package:odc/presentation/screens/settings/support/support_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../presentation/screens/notes/notes_add.dart';
import '../../presentation/screens/settings/our_partners/our_partners_screen.dart';
import '../../presentation/screens/settings/terms_&_conditions/terms_&_conditions_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../../presentation/screens/news/news_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "SplashScreen":
        return PageTransition(
            child:  SplashScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'RegisterScreen':
        return PageTransition(
            child: RegisterScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'LoginScreen':
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'NewsScreen':
        return PageTransition(
            child: NewsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'Settings':
        return PageTransition(
            child: SettingsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case "FAQ":
        return PageTransition(
            child: FAQ(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case "Terms & Conditions":
        return PageTransition(
            child: const TermsAndConditions(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case "Our Partners":
        return PageTransition(
            child: const OurPartners(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case "Support":
        return PageTransition(
            child: Support(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'AppLayout':
        return PageTransition(
            child: const AppLayout(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'HomeScreen':
        return PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'EventsScreen':
        return PageTransition(
            child: const EventsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'FinalsScreen':
        return PageTransition(
            child: const FinalsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'LecturesScreen':
        return PageTransition(
            child: const LecturesScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'SectionsScreen':
        return PageTransition(
            child: const SectionsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'MidtermsScreen':
        return PageTransition(
            child: MidtermsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case 'NotesScreen':
        return PageTransition(
            child: const NotesScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      case "AddNotesScreen":
        return PageTransition(
            child: AddNotesScreen(),
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid Route!!'),
        ),
      );
    });
  }
}
