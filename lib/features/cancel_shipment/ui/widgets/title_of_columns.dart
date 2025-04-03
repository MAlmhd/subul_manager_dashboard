
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';

class TitleOfColumns extends StatelessWidget {
  const TitleOfColumns({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(width: size.width / 8),
        Text('حالة الشحنة', style: Styles.textStyle20.copyWith(fontSize: 6.sp)),
        SizedBox(width: size.width / 16),
        Text('عدد الطرود', style: Styles.textStyle20.copyWith(fontSize: 6.sp)),
        SizedBox(width: size.width / 16),
        Text('العميل', style: Styles.textStyle20.copyWith(fontSize: 6.sp)),
        SizedBox(width: size.width / 16),
        Text('كود الشحنة', style: Styles.textStyle20.copyWith(fontSize: 6.sp)),
        SizedBox(width: size.width / 20),
      ],
    );
  }
}
