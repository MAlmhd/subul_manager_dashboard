import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_dialog.dart';

class ConfirmDelete extends StatelessWidget {
  const ConfirmDelete({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomDialog(
        widget: Text(
          'تأكيد الحذف',
          style: Styles.textStyle6Sp.copyWith(color: AppColors.goldenYellow,),
        ), sigmaX: 5.0, sigmaY: 5.0, 
      ),
    );
  }
}
