import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomSwitchLabel extends StatelessWidget {
  const CustomSwitchLabel({
    super.key,
    required this.label,
    required this.textColor,
    required this.activeColor,
    required this.disableColor,
    required this.isActive,
  });
  final String label;
  final Color textColor;
  final Color activeColor;
  final Color disableColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50.w,
          child: Text(
            label,
            textAlign: TextAlign.end,
            style: Styles.textStyle4Sp.copyWith(color: textColor),
            overflow: TextOverflow.clip,
          ),
        ),
        SizedBox(width: size.width / 90),
        SizedBox(
          width: 20.w,
          child: FlutterSwitch(
            width: 40.0,
            height: 23.0,
            toggleSize:
                18.0, // slightly larger to match the white circle in image
            value: isActive,
            borderRadius: 20.0,
            padding: 2.0, // reduced padding to center the toggle better
            activeColor: activeColor,
            inactiveColor: disableColor,
            toggleColor: AppColors.white,
            onToggle: (val) {},
          ),
        ),
      ],
    );
  }
}
