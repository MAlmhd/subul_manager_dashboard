import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class BillOfShippment extends StatelessWidget {
  const BillOfShippment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 150.w,
      height: 500.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('7575757577', style: Styles.textStyle6Sp),
                    Text('احمد', style: Styles.textStyle6Sp),
                    Text('4', style: Styles.textStyle6Sp),
                    Container(
                      width: 30.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(cornerRadius),
                      ),
                      child: Center(
                        child: Text('مكتملة', style: Styles.textStyle5Sp),
                      ),
                    ),
                    Text('شحن ودفع', style: Styles.textStyle6Sp),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('كود الشحنة', style: Styles.textStyle6Sp),
                    Text('العميل', style: Styles.textStyle6Sp),
                    Text('عدد الطرود', style: Styles.textStyle6Sp),
                    Text('حالة الشحنة', style: Styles.textStyle6Sp),
                    Text('نوع الشحن', style: Styles.textStyle6Sp),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 60.w,
            height: 50.h,

            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(cornerRadius),
              border: Border.all(color: AppColors.deepPurple, width: 1),
            ),
            child: Center(child: Text('الفاتورة', style: Styles.textStyle6Sp)),
          ),
          SizedBox(height: size.height / 24),
        ],
      ),
    );
  }
}
