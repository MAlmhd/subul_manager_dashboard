import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class TrackNumberCard extends StatelessWidget {
  const TrackNumberCard({super.key, required this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.deepPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SizedBox(
          width: 80.w,
          child: Text(
            'رقم التتبع الخاص بك:$number',
            textAlign: TextAlign.center,
            style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
