import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/progress_tracker.dart';

class ShipmentStatusCard extends StatelessWidget {
  const ShipmentStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      width: 50.w,
      height: 280.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height / 20),
            Text(
              'كود الشحنة:5454',
              style: Styles.textStyle4Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: size.height / 20),
            Text(
              'كود العميل:5454',
              style: Styles.textStyle4Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: size.height / 20),
            ProgressTracker(),
            SizedBox(height: size.height / 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '.....',
                    style: Styles.textStyle4Sp,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    'غير مكتمل',
                    style: Styles.textStyle4Sp,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Expanded(
                  child: Text(
                    'مكتمل',
                    textAlign: TextAlign.end,
                    style: Styles.textStyle4Sp,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 20),
          ],
        ),
      ),
    );
  }
}
