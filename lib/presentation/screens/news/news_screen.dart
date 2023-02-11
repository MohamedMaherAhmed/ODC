import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:odc/business_logic/news/news_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:sizer/sizer.dart';
import '../../views/news_card/news_card.dart';
import '../../widgets/default_text.dart';

//This screen use for get news
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        NewsCubit myCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const DefaultText(
              text: "News",
              fontSize: 28,
              color: AppColors.black,
            ),
          ),
          body: Conditional.single(context: context,
              conditionBuilder: (_) =>
              myCubit.newsModel != null && myCubit.newsModel!.news.isNotEmpty,
              widgetBuilder: (_) =>
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: Column(children: [
                      SizedBox(height: 8.sp),
                      Expanded(
                          child: ListView.builder(
                            itemCount: myCubit.newsModel!.news.length,
                            itemBuilder: (context, index) {
                              return NewsCard(
                                news: myCubit.newsModel!.news[index],
                              );
                            },
                          ))
                    ]),
                  ),
              fallbackBuilder: (_) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ));
      },
    );
  }
}
