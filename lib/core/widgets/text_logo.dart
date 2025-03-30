import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "S U B U L",

      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        foreground:
            Paint()
              ..shader = LinearGradient(
                colors: [
                  AppColors.richPurple,
                  AppColors.goldenYellow,
                  AppColors.vibrantOrange,
                  AppColors.deepPurple,
                ],
                stops: [0.25, 0.5, 0.75, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0.0, 0.0, 350.0, 100.0)),
      ),
    );
  }
}
