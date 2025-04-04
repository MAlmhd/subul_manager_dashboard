import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(20),
      ),

      child: TextField(
        textAlign: TextAlign.right,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ' ...بحث',
          hintStyle: Styles.textStyle3Sp.copyWith(color: AppColors.deepGray),
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
                child: Center(child: SvgPicture.asset(AssetsData.searchIcon)),
              ),
            ),
          ),
        ),

        textDirection: TextDirection.rtl,
      ),
    );
  }
}
