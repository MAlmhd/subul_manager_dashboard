
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 70.w,
      height: 120.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.deepPurple, width: 2),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                label,
                style: Styles.textStyle3Sp.copyWith(color: AppColors.deepGray,)
              ),
            ),
            SizedBox(width: size.width / 70),
            Icon(Icons.camera_alt, color: AppColors.goldenYellow),
          ],
        ),
      ),
    );
  }
}
