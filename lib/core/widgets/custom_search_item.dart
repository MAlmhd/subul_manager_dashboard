import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({
    super.key,
    this.icon,
    this.svgPicture,
    this.backgoundColor,
    this.hintText, this.textColor,
  });
  final Icon? icon;
  final SvgPicture? svgPicture;
  final Color? backgoundColor;
  final Color? textColor;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: backgoundColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: TextField(
        textAlign: TextAlign.right,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Styles.textStyle3Sp.copyWith(color: textColor),
          contentPadding: EdgeInsets.all(16.0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Container(
              width: 40,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.goldenYellow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child:
                      icon ?? svgPicture,
                ),
              ),
            ),
          ),
        ),

        textDirection: TextDirection.rtl,
      ),
    );
  }
}
