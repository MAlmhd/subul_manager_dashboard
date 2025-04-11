import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomSwitchLabel extends StatelessWidget {
  const CustomSwitchLabel({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: Styles.textStyle4Sp),
        SizedBox(width: size.width / 90),
        FlutterSwitch(
          width: 40.0,
          height: 23.0,
          toggleSize:
              18.0, // slightly larger to match the white circle in image
          value: false,
          borderRadius: 20.0,
          padding: 2.0, // reduced padding to center the toggle better
          activeColor: AppColors.deepPurple,
          inactiveColor: AppColors.grayDark,
          toggleColor: AppColors.white,
          onToggle: (val) {},
        ),
      ],
    );
  }
}
