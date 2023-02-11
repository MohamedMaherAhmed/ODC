import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/news_model/news_model.dart';
import '../../widgets/default_text.dart';

//This card create for get news
class NewsCard extends StatelessWidget {
  NewsCard({Key? key, required this.news}) : super(key: key);

  NewsDataModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
      child: ListTile(
        minVerticalPadding: 5.sp,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        isThreeLine: true,
        tileColor: AppColors.greyishBlue,
        textColor: AppColors.primaryColor,
        style: ListTileStyle.list,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.only(left: 1.sp,),
        leading: CircleAvatar(
          radius: 25.sp,
          backgroundImage: NetworkImage(news.image,scale: 45.sp),
        ),
        title: DefaultText(text: news.title!),
        horizontalTitleGap: 10.sp,
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(text: getCardContent(news.body!)),
            DefaultText(text: news.date!),
          ],
        ),
      ),
    );
  }

  //reduce news body text for the card
  String getCardContent(String content) {
    return content.length > 70 ? '${content.substring(0, 70)}...' : content;
  }
}
