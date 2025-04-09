import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_ok_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key, required this.onTap});
  final Function() onTap;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime focusedDay = DateTime(2025, 4, 2);
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(),
        ),
        Container(
          width: 120.w,
          height: 600.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1, color: AppColors.goldenYellow),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      'حدد تاريخ إستلام الشحنة',
                      style: Styles.textStyle5Sp,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: size.width / 40),
                  Icon(
                    Icons.edit_calendar_outlined,
                    color: AppColors.deepPurple,
                    size: 7.w,
                  ),
                ],
              ),
              SizedBox(height: size.height / 20),
              Container(
                width: 115.w,
                height: 400.h,

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: AppColors.deepPurple),
                ),
                child: SingleChildScrollView(
                  child: TableCalendar(
                    locale: 'ar',

                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                    calendarFormat: CalendarFormat.month,
                    daysOfWeekHeight: 30,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextFormatter:
                          (date, locale) =>
                              DateFormat.yMMMM(locale).format(date),
                      leftChevronIcon: const Icon(Icons.arrow_back_ios),
                      rightChevronIcon: const Icon(Icons.arrow_forward_ios),
                      titleTextStyle: Styles.textStyle5Sp,
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: AppColors.teal,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: AppColors.black),
                      defaultTextStyle: TextStyle(color: AppColors.black),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: AppColors.black),
                      weekdayStyle: TextStyle(color: AppColors.black),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        this.selectedDay = selectedDay;
                        this.focusedDay = focusedDay;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height / 20),
              CustomOkButton(onTap: widget.onTap),
            ],
          ),
        ),
      ],
    );
  }
}
