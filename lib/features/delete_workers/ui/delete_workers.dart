import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/select_worker.dart';
import 'package:subul_manager_dashboard/features/delete_workers/ui/widgets/confirm_delete.dart';
import 'package:subul_manager_dashboard/features/delete_workers/ui/widgets/success_dialog.dart';

class DeleteWorkers extends StatelessWidget {
  const DeleteWorkers({
    super.key,
    required this.onTap,
    required this.showConfirmDelete, required this.confirmDeleteButton, required this.deleteIsConfirmed,
  });
  final Function() onTap;
  final Function() confirmDeleteButton;
  final bool showConfirmDelete;
  final bool deleteIsConfirmed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Container(
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
                        hintStyle: Styles.textStyle16.copyWith(
                          color: Colors.grey,
                        ),
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
                                child: SvgPicture.asset(AssetsData.searchIcon),
                              ),
                            ),
                          ),
                        ),
                      ),

                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 6),
            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 10.h),
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(
                    color: AppColors.deepPurple,
                    width: 1,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    ...List.generate(
                      6,
                      (index) => TableRow(
                        children: List.generate(2, (colIndex) {
                          return TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,

                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 30.w,
                                right: 30.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: onTap,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SelectWorker(isSelected: false),
                                        SizedBox(width: size.width / 70),
                                        Text(
                                          "shahed",
                                          style: Styles.textStyle20.copyWith(
                                            color: AppColors.deepPurple,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 6.sp,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height / 2),
          ],
        ),
        if (showConfirmDelete)
          Padding(padding: EdgeInsets.only(top: 170.h), child: ConfirmDelete(onTap: confirmDeleteButton,)),
          if(deleteIsConfirmed)
          Padding(padding: EdgeInsets.only(top: 170.h), child: SuccessDialog(),)
      ],
    );
  }
}
