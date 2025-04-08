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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '7575757577',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Text(
                          'احمد',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Text(
                          '4',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Container(
                          width: 30.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(cornerRadius),
                          ),
                          child: Center(
                            child: Text(
                              'مكتملة',
                              style: Styles.textStyle5Sp,
                              overflow: TextOverflow.visible,
                              softWrap: true,
                            ),
                          ),
                        ),
                        Text(
                          'شحن ودفع',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width / 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'كود الشحنة',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Text(
                          'العميل',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Text(
                          'عدد الطرود',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Text(
                          'حالة الشحنة',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        Text(
                          'نوع الشحن',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.ellipsis,
                          //  softWrap: true,
                        ),
                      ],
                    ),
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
              child: Center(
                child: Text(
                  'الفاتورة',
                  style: Styles.textStyle6Sp,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
            SizedBox(height: size.height / 24),
          ],
        ),
      ),
    );
  }
}
