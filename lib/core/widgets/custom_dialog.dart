import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.widget,required this.sigmaX, required this.sigmaY});
  final Widget widget;
  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY:sigmaY),
          child: Container(),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Container(
              width: 100.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.deepPurple,
                borderRadius: BorderRadius.circular(cornerRadius),
                border: Border.all(width: 1, color: AppColors.goldenYellow),
              ),
              child: Center(child: widget),
            ),
          ),
        ),
      ],
    );
  }
}
