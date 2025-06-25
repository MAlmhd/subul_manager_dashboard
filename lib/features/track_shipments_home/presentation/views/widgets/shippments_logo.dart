import 'package:flutter/material.dart';

import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class ShippmentsLogo extends StatelessWidget {
  const ShippmentsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback:
          (bounds) => LinearGradient(
            colors: [
              AppColors.richPurple,
              AppColors.goldenYellow,
              AppColors.vibrantOrange,
              AppColors.deepPurple,
            ],
            stops: [0.25, 0.5, 0.75, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        "الشحنات",
        style: Styles.textStyle7Sp.copyWith(color: AppColors.white),
      ),
    );
  }
}
