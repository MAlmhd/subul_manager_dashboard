import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_dialog.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({super.key});

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد الـ AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // مدة التلاشي
    );

    _fadeAnimation = Tween<double>(begin: 2.0, end: 0.0).animate(_controller);

    // تشغيل الأنيميشن عند ظهور الويجت
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // تنظيف الذاكرة عند إغلاق الويدجت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: CustomDialog(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تمّ الحذف',
              style: Styles.textStyle20.copyWith(
                fontSize: 6.sp,
                color: AppColors.goldenYellow,
              ),
            ),
            SizedBox(width: size.width / 70),
            Icon(Icons.check_circle, color: AppColors.goldenYellow),
          ],
        ),
        sigmaX: 0.0,
        sigmaY: 0.0,
      ),
    );
  }
}
