import 'package:flutter/material.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../widgets/default_app_bar_icon_btn.dart';
import '../../widgets/default_text.dart';

class MidtermsScreen extends StatelessWidget {
  MidtermsScreen({Key? key}) : super(key: key);
  List<Appointment> meetings = [
    Appointment(
        startTime: DateTime(2022,9,20,0,0,0),
        endTime: DateTime(2022,9,20,0,0,0).add(Duration(hours: 3,minutes: 59)),
        color: AppColors.primaryColor,
        isAllDay: true,
        subject: "Event"),
    Appointment(
        startTime: DateTime(2022,9,20,0,0,0),
        endTime: DateTime(2022,9,20,0,0,0).add(Duration(hours: 20,minutes: 59)),
        color: AppColors.primaryColor,
        isAllDay: true,
        subject: "Event"),
    Appointment(
        startTime: DateTime(2022,9,22,0,0,0),
        endTime: DateTime(2022,9,22,0,0,0).add(Duration(hours: 15,minutes: 59)),
        color: AppColors.primaryColor,
        isAllDay: true,
        subject: "Hello"),
    Appointment(
        startTime: DateTime(2022,9,24,0,0,0),
        endTime: DateTime(2022,9,24,0,0,0).add(Duration(hours: 20,minutes: 59)),
        color: AppColors.primaryColor,
        isAllDay: true,
        subject: "Hello"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(
          text: "Midterms",
          color: AppColors.black,
          fontSize: 25.sp,
        ),
        centerTitle: true,
        leading: DefaultLeadingIconBtn(),
        backgroundColor: AppColors.white,
        elevation: 2,
      ),
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 6,
        initialDisplayDate: DateTime.now().toUtc(),
        initialSelectedDate: DateTime.now().toUtc(),
        dataSource: MeetingsDataSource(meetings),
        monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    );
  }
}

class MeetingsDataSource extends CalendarDataSource {
  MeetingsDataSource(List<Appointment> source) {
    appointments = source;
  }
}
