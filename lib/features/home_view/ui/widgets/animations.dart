import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/widgets/build_animated_icons.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/widgets/build_animated_welcome_text.dart';

class Animations extends StatelessWidget {
  const Animations({super.key, required this.step, required this.opacity});
  final int step;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
    //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildAnimatedWelcomeText(opacity: opacity),
        SizedBox(
          height: size.height / 12,
        ),
        BuildAnimatedIcons(step: step),
      ],
    );
  }
}
