import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class BuildAnimatedWelcomeText extends StatelessWidget {
  const BuildAnimatedWelcomeText({super.key, required this.opacity});
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: opacity,
        child: Text(
          'أهلاً بك في سُبُل',
          style: Styles.textStyle10Sp.copyWith(color: AppColors.deepPurple,),
        ),
      ),
    );
  }
}
