import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class PriceSquare extends StatelessWidget {
  const PriceSquare({super.key, required this.price, required this.onTap, required this.isSelected});
  final int price;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 20.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.deepPurple.withValues(alpha: 0.5): AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(price.toString(), style: Styles.textStyle5Sp),
          ),
        ),
      ),
    );
  }
}
