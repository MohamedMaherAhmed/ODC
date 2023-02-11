import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:odc/business_logic/terms/terms_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/default_app_bar_icon_btn.dart';
import '../../../widgets/default_text.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsCubit, TermsState>(builder: (context, state) {
      TermsCubit termsCubit = TermsCubit.get(context);
      var richTerms =
          HTML.toTextSpan(context, termsCubit.termsModel?.data?.terms ?? "",
              defaultTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff555555),
                decoration: TextDecoration.none,
                fontSize: 17.sp,
              ));
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: DefaultText(
            text: 'Terms & Conditions',
            fontSize: 25.sp,
            color: AppColors.black,
          ),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          leading: DefaultLeadingIconBtn(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(5.sp),
          child: Conditional.single(
            context: context,
            conditionBuilder: (_) => state is! TermsLoading,
            widgetBuilder: (_) => Container(
                padding: EdgeInsets.only(
                    left: 0.5.sp, top: 10.sp, right: 0.5.sp, bottom: 10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: AppColors.greyishBlue,
                ),
                child:
                    RichText(text: richTerms, softWrap: true, maxLines: null)),
            fallbackBuilder: (_) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      );
    });
  }
}
