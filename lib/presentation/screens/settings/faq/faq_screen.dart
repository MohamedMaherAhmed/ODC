import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:odc/business_logic/faq/faq_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/presentation/widgets/default_app_bar_icon_btn.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
import 'package:simple_html_css/simple_html_css.dart';

class FAQ extends StatelessWidget {
  FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        FaqCubit faqCubit = FaqCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: DefaultLeadingIconBtn(),
            elevation: 0,
            backgroundColor: AppColors.transparent,
            centerTitle: true,
            title: DefaultText(
              text: "FAQ",
              color: AppColors.black,
              fontSize: 20.sp,
            ),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (_) =>
                (state is FaqLoading || faqCubit.faqModel == null),
            widgetBuilder: (_) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            fallbackBuilder: (_) => Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 5, start: 7, end: 8, bottom: 12),
              child: ListView.builder(
                padding: const EdgeInsetsDirectional.all(15),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: faqCubit.faqModel?.List_FAQData.length,
                itemBuilder: (_, int index) {
                  final TextSpan question = HTML.toTextSpan(
                      context,
                      defaultTextStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          decoration: TextDecoration.none),
                      "${faqCubit.faqModel?.List_FAQData[index].question}");
                  final TextSpan answer = HTML.toTextSpan(context,
                      defaultTextStyle:  TextStyle(
                          color: AppColors.black,
                          fontSize: 12.sp,
                          decoration: TextDecoration.none),
                      "${faqCubit.faqModel?.List_FAQData[index].answer}");
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: AppColors.white,
                    child: ExpansionTile(
                      title: RichText(
                        text: question,
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      maintainState: true,
                      childrenPadding: const EdgeInsetsDirectional.all(10),
                      children: [
                        RichText(
                          text: answer,
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
