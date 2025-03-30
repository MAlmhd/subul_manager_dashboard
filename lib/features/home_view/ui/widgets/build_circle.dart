import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class BuildCircle extends StatelessWidget {
  const BuildCircle({
    super.key,
    required this.icon,
    required this.color,
    required this.size,
    required this.label,
  });
  final String icon;
  final Color color;
  final Size size;
  final String label;
  @override
  Widget build(BuildContext context) {
    Color iconColor =
        color == AppColors.goldenYellow
            ? AppColors.deepPurple
            : AppColors.goldenYellow;
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 10.w,
          backgroundColor: color,
          child: Iconify(icon, color: iconColor, size: 10.w),
        ),
        SizedBox(height: size.height * 0.04),
        Text(
          label,
          style: Styles.textStyle36.copyWith(
            color: AppColors.deepPurple,
            fontSize: 8.sp,
          ),
        ),
      ],
    );
  }
}
