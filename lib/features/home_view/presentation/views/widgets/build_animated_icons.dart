import 'package:flutter/material.dart';

import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/home_view/presentation/views/widgets/build_circle.dart';

class BuildAnimatedIcons extends StatelessWidget {
  const BuildAnimatedIcons({super.key, });

  // final int step;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   final List<Color> colors = [AppColors.deepPurple, AppColors.goldenYellow];

    // Color getBackgroundColor(int index) =>
    //     (step + index) % 2 == 0 ? colors[0] : colors[1];
    final icons = [
      GameIcons.fast_arrow,
      MaterialSymbols.diamond_outline_rounded,
      MaterialSymbols.security,
    ];

    return SizedBox(
      width: size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) =>
              Padding(
                    padding: EdgeInsets.only(right: size.width * 0.03),
                    child: BuildCircle(
                      icon: icons[index],
                      color: colors[0],
                      size: size,
                      label: ['سرعة', 'جودة', 'أمان'][index],
                    ),
                  )
                 
        ),
      ),
    );
  }
}


/**
 *  : Padding(
                    padding: EdgeInsets.only(right: size.width * 0.03),
                    child:  CircleAvatar(
                      maxRadius: 10.w,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
 */