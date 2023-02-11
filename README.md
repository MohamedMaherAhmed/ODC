# Table of contents

  *  [General Info](#general-info)
  *  [Technologies](#technologies)
  *  [Video](#screenshots)
  *  [App Installation](#app-installation)

# General Info

This ODC Flutter App is a project i did during my time in a Flutter workshop, the instructor helped me along the way but most of what i did is mine and this workshop was to better the Flutter Developers' skills and knowledge in Flutter Intermediate to Advanced topics with implementation.

## Technologies

The following are the Programming Language and Framework that I used to build this app:
   * [Dart](https://dart.dev/get-dart) 2.17.6 
   * [Flutter](https://docs.flutter.dev/get-started/install) 3.0.5

I also used Android Studio Dolphin | 2021.3.1 as my IDE   

The following are the Flutter Packages I used during the development of this app:
   * [Dio](https://pub.dev/packages/http) 4.0.6, Used to make API requests to the back end server.
   * [flutter_conditional_rendering](https://pub.dev/packages/flutter_conditional_rendering) 2.0.0, Used this package to render certain widgets according to a certain condition.
   * [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) 0.9.2, Used this package to generate the launcher icon for the app.
   * [page_transition](https://pub.dev/packages/page_transition) 2.0.9, Used this package to animate navigation between UIs and even added a duration to the animation as some high-end devices have high Refresh Rate so the navigation and the animation of it occur super fast and the user don't see it or feel it which degrades the UX for the user and this package fixed this issue.
   * [Sizer](https://pub.dev/packages/sizer) 2.0.15, Used this package to reform or resize the app according to the dimensions of the device used.
   * [bottom_navy_bar](https://pub.dev/packages/bottom_navy_bar) 6.0.0, Used this package to make a bottom navigation bar to transition between different pages beautifully and smoothly.
   * [flutter_svg](https://pub.dev/packages/flutter_svg) 1.1.5, Used this package to render SVG files and display them in the app.
   * [shared_preferences](https://pub.dev/packages/shared_preferences) 2.0.15, Used this package to locally store some values and be able to modify or read them as simple key-value pairs whenever needed.
   * [sqflite](https://pub.dev/packages/sqflite) 2.0.3+1, Used this package to store big chunks of data locally in DataBase form (Table with records).
   * [bloc](https://pub.dev/packages/bloc) 8.1.0, Used this package for its state management library that helps implement the BLoC (Business Logic Component) design pattern.
   * [flutter_bloc](https://pub.dev/packages/flutter_bloc) 8.1.1, Used this package for using Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern as it was built to be used with the [bloc](https://pub.dev/packages/bloc) state management package.
   * [path_provider](https://pub.dev/packages/path_provider) 2.0.11, Used this package to be able to find and access local path to create and store DataBase file(s).
   * [fluttertoast](https://pub.dev/packages/fluttertoast) 8.0.9, Used this package to display important messages to the user such as Succefull login/register.
   * [syncfusion_flutter_calendar](https://pub.dev/packages/syncfusion_flutter_calendar) 20.2.50, Used this package to represent events efficiently.
   * [google_fonts](https://pub.dev/packages/google_fonts) 3.0.1, Used this package to use fonts from fonts.google.com inside the app as it supports HTTP fetching, caching, and asset bundling. 
   * [easy_splash_screen](https://pub.dev/packages/easy_splash_screen) 1.0.4, Used this package to quickly show a splash screen and save time. 
   * [simple_html_css](https://pub.dev/packages/simple_html_css) 4.0.0, Used this package to remove some CSS styling done from the API side so the text gotten from the API would look how I (the developer) wanted it to look.
   * [intl](https://pub.dev/packages/intl) 0.17.0, Used this package for date formatting and parsing.
   
# Video

[Project Presentation](https://drive.google.com/file/d/1oebtmg2rnJx69B8_HjqTfPDiy5EaW1px/view?usp=share_link)

## App Installation

 * Download the project from the repository.
 * Build it through any IDE that can use Dart (Flutter).
 * After that, you will find your apk inside the project folder called "build" through this path "build\app\outputs\flutter-apk".
