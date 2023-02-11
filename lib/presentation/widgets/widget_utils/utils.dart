import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_colors/appColors.dart';
import '../default_text.dart';
import 'package:intl/intl.dart';

class Utils {
  static final TextEditingController titleController = TextEditingController();

  static String toDateTime(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);
    return '$date $time';
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    return '$date';
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);
    return '$time';
  }

  static Widget buildDropDownField(
          {required String text, required VoidCallback onClicked}) =>
      ListTile(
        title: DefaultText(
          text: text,
          color: AppColors.white,
          fontSize: 13.sp,
        ),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  static Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: 5.sp, bottom: 5.sp, top: 10.sp, right: 5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            child,
          ],
        ),
      );

  static Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
    required BuildContext ctx,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: ctx,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 0),
        lastDate: DateTime(2101),
      );
      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: ctx, initialTime: TimeOfDay.fromDateTime(initialDate));

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);

      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  static Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24.sp),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Add Title",
        ),
        controller: titleController,
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        onFieldSubmitted: (_) {},
      );

  static Widget buildDateTimePickers(
          {required Widget buildFrom, required Widget buildTo}) =>
      Column(
        children: [
          buildFrom,
          buildTo,
        ],
      );
}
