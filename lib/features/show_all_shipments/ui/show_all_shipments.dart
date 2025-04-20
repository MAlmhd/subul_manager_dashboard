import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/core/widgets/icon_text_button.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/show_all_shipments/ui/widgets/custom_item_in_show_all_shipments_table.dart';
import 'package:subul_manager_dashboard/features/show_all_shipments/ui/widgets/name_of_columns_in_show_all_shipments_table.dart';

class ShowAllShipments extends StatelessWidget {
  const ShowAllShipments({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.grey, AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 30.h,
                  ),
                  child: SizedBox(
                    width: 600.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLogo(),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            'عرض جميع الطرود',
                            style: Styles.textStyle7Sp.copyWith(
                              color: AppColors.goldenYellow,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        CustomSearchItem(
                          backgoundColor: AppColors.white,
                          hintText: 'فلترة من خلال',
                          icon: Icon(Icons.tune, color: AppColors.white),
                          textColor: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height / 120),
                NameOfColumnsInShowAllShipmentsTable(),
                SizedBox(height: size.height / 30),
                SizedBox(
                  height: 430.h,
                  width: 600.w,
                  child: ListView.builder(
                    itemBuilder:
                        (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 25.h),
                          child: CustomItemInShowAllShipmentsTable(),
                        ),
                    itemCount: 10,
                  ),
                ),
                SizedBox(height: size.height / 50),
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: SizedBox(
                    width: 40.w,
                    child: Text(
                      ':القيمة الإجمالية',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 20.h,
                  ),

                  child: SizedBox(
                    width: 125.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 55.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.goldenYellow,
                            borderRadius: BorderRadius.circular(cornerRadius),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('إنشاء طرد', style: Styles.textStyle3Sp),
                              Icon(Icons.add, color: AppColors.white),
                            ],
                          ),
                        ),
                        Container(
                          width: 80.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: AppColors.goldenYellow,
                            borderRadius: BorderRadius.circular(cornerRadius),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
