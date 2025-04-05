import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/top_left_part_of_icon.dart';
import 'package:subul_manager_dashboard/core/widgets/top_right_part_of_icon.dart';

class CustomIconOfSideBar extends StatelessWidget {
  const CustomIconOfSideBar({
    super.key,
    this.icon,
    this.color,
    this.image,
    required this.onTap, required this.isSelected,
  });
  final IconData? icon;
  final Color? color;
  final String? image;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 3.w),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              SizedBox(
                height: 65.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          size: Size(4.w, 12.h),
                          painter: TopLeftPart(isSelected ? AppColors.brightBlue : AppColors.deepPurple),
                        ),
                        SizedBox(width: size.width / 270),
                        CustomPaint(
                          size: Size(4.w, 12.h),
                          painter: TopRightPart(isSelected ? AppColors.brightBlue : AppColors.deepPurple),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height / 150),
                    Container(
                      width: 13.w,
                      height: 27.h,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.brightBlue : AppColors.deepPurple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -1.w,
                bottom: 5.h,
                child: CircleAvatar(
                  backgroundColor: AppColors.goldenYellow,
                  maxRadius: 5.w,
                  child: CircleAvatar(
                    backgroundColor: isSelected ? AppColors.brightBlue : AppColors.deepPurple,
                    maxRadius: 3.7.w,
                    child:
                        icon != null
                            ? Icon(icon, color: color, size: 5.w)
                            : SvgPicture.asset(image!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
