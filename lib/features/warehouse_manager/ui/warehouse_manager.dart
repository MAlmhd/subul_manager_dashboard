import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/edit_receiving_shipments_table.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/add_shipment_form.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_input_field.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_text_field_in_warehouse_manager.dart';

class WarehouseManager extends StatelessWidget {
  const WarehouseManager({super.key});

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
          child: Row(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 40.h),
                        child: TextLogo(),
                      ),
                      SizedBox(height: size.height / 10),
                      Container(
                        width: 20.w,
                        height: 900.h,
                        decoration: BoxDecoration(
                          color: AppColors.goldenYellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(120),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconOfSideBar(
                              icon: Icons.add,
                              color: AppColors.white,
                              onTap: () {},
                              isSelected: false,
                            ),
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              icon: Icons.local_shipping,
                              color: AppColors.white,
                              onTap: () {},
                              isSelected: false,
                            ),
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              image: AssetsData.boxShipmmentIcon,
                              onTap: () {},
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: 0,
                  children: [
                    //AddShipmentForm(),
                    // EditReceivingShipmentsTable(
                    //   widget: CustomOkButton(
                    //     onTap: () {},
                    //     color: AppColors.goldenYellow,
                    //     label: 'تعديل',
                    //   ),
                    // ),
                    EditShippingDetail(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditShippingDetail extends StatelessWidget {
  const EditShippingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 140.w,
      height: 900.h,
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 3.w),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFiledInWarehouseManager(
              icon: Iconify(
                FluentMdl2.date_time,
                color: AppColors.deepPurple,
                size: 8.w,
              ),
              iconInLeft: false,
              hintText: 'تاريخ  الإرسال',
            ),
            SizedBox(height: size.height / 10),
            CustomTextFiledInWarehouseManager(
              icon: Iconify(
                GameIcons.infinity,
                color: AppColors.deepPurple,
                size: 8.w,
              ),
              iconInLeft: true,
              hintText: 'الرمز',
            ),
            SizedBox(height: size.height / 10),
            CustomTextFiledInWarehouseManager(
              icon: Iconify(
                Ph.navigation_arrow_fill,
                color: AppColors.deepPurple,
                size: 8.w,
              ),
              iconInLeft: false,
              hintText: 'البلد المصدر',
            ),
            SizedBox(height: size.height / 10),
            CustomTextFiledInWarehouseManager(
              icon: Iconify(
                Ph.navigation_arrow_fill,
                color: AppColors.deepPurple,
                size: 8.w,
              ),
              iconInLeft: true,
              hintText: 'الرمز الوجهة',
            ),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: 100.w,
              child: Text(
                'تكلفة التوصيل الداخلي في المصدر',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: size.height / 20),
            CustomTextInputFieldWithoutIconInWarehouseSection(),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: 100.w,
              child: Text(
                'تكلفة البريد السريع في المصدر',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: size.height / 20),
            CustomTextInputFieldWithoutIconInWarehouseSection(),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: 100.w,
              child: Text(
                'تكلفة الجمارك في المصدر',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: size.height / 20),
            CustomTextInputFieldWithoutIconInWarehouseSection(),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: 100.w,
              child: Text(
                'تكلفة الطيران في المصدر',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: size.height / 20),
            CustomTextInputFieldWithoutIconInWarehouseSection(),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: 100.w,
              child: Text(
                'تكلفة التوصيل الداخلي في الوجهة',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: size.height / 20),
            CustomTextInputFieldWithoutIconInWarehouseSection(),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: 100.w,
              child: Text(
                'تحديد فيما كانت الشحنة قد تم إرسالها أم لا',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Iconify(
                  Ph.check_circle,
                  color: AppColors.goldenYellow,
                  size: 10.w,
                ),
                Iconify(Ph.x_circle, color: AppColors.goldenYellow, size: 10.w),
              ],
            ),
            SizedBox(height: size.height / 30),
            CustomOkButton(
              onTap: () {},
              color: AppColors.deepPurple,
              label: 'موافق',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextInputFieldWithoutIconInWarehouseSection
    extends StatelessWidget {
  const CustomTextInputFieldWithoutIconInWarehouseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 50.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: TextField(
          // textDirection: TextDirection.rtl,
          textAlign: TextAlign.end,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
