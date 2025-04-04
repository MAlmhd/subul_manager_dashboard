import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/delete_workers/ui/widgets/success_dialog.dart';

class ReasonForCancellation extends StatelessWidget {
  const ReasonForCancellation({
    super.key,
    required this.onTap,
    required this.showSuccesDialog,
  });
  final Function() onTap;
  final bool showSuccesDialog;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child:
          showSuccesDialog
              ? Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: SuccessDialog(),
              )
              : Container(
                width: 110.w,
                height: 190.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerRadius),
                  color: AppColors.goldenYellow,
                  border: Border.all(width: 1, color: AppColors.deepPurple),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      SizedBox(height: size.height / 20),
                      Text("تسجيل سبب الالغاء:", style: Styles.textStyle6Sp),
                      SizedBox(height: size.height / 40),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          TextField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          Positioned(
                            top: 35.h,
                            child: Dash(
                              length: 85.w,
                              dashColor: Colors.black,
                              dashLength: 2,
                              dashGap: 3,
                              dashThickness: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 40),
                      Flexible(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: onTap,
                            child: Container(
                              width: 40.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.deepPurple,
                                borderRadius: BorderRadius.circular(
                                  cornerRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'تأكيد الحذف',
                                  style: Styles.textStyle3Sp.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
