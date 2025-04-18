import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomOkButton extends StatelessWidget {
  const CustomOkButton({super.key, required this.onTap, required this.color, required this.label});
  final Function() onTap;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          child: Center(
            child: Text(
              label,
              style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
