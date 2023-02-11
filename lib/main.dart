import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/auth/login/login_cubit.dart';
import 'package:odc/business_logic/faq/faq_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import 'package:odc/data/data_provider/remote/dio_helper.dart';
import '../constants/route_generator/route_generator.dart';
import 'package:sizer/sizer.dart';
import 'business_logic/auth/register/register_cubit.dart';
import 'business_logic/news/news_cubit.dart';
import 'business_logic/notes/notes_cubit.dart';
import 'business_logic/terms/terms_cubit.dart';
import 'data/data_provider/local/sql_helperl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  await HelperSql.db;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginCubit()),
          BlocProvider(create: (_) => RegisterCubit()),
          BlocProvider(create: (_) => NewsCubit()..getNews()),
          BlocProvider(create: (_) => FaqCubit()..getFAQ()),
          BlocProvider(create: (_) => TermsCubit()..getTermsConditions()),
          BlocProvider(create: (_) => NotesCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                primary: AppColors.primaryColor,
                side: const BorderSide(color: AppColors.primaryColor),
              ),
            ),
            primarySwatch: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor),
              ),
            ),
          ),
          initialRoute: 'SplashScreen',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      );
    });
  }
}
