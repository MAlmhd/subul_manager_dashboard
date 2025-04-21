import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_switch_label.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/show_all_shipments/ui/widgets/custom_note.dart';
import 'package:subul_manager_dashboard/features/show_all_shipments/ui/widgets/labeled_icon_text_field.dart';
import 'package:subul_manager_dashboard/features/show_all_shipments/ui/widgets/labeled_input_field.dart';

class CreateShipment extends StatelessWidget {
  const CreateShipment({super.key});

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'قسم العد:',
                              style: Styles.textStyle5Sp.copyWith(
                                color: AppColors.goldenYellow,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: size.height / 50),
                            SizedBox(
                              width: 100.w,
                              height: 200.h,
                              child: SingleChildScrollView(
                                child: Table(
                                  border: TableBorder.all(
                                    color: AppColors.deepPurple,
                                    width: 1.5,
                                  ),
                                  columnWidths: {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        tableHeader('العدد'),
                                        tableHeader('العنصر'),
                                      ],
                                    ),
                                    ...List.generate(10, (_) {
                                      return TableRow(
                                        children: [
                                          tableCell('5'),
                                          tableCell('كتب'),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: size.height / 10),
                            Text(
                              'محتوى الطرد:',
                              style: Styles.textStyle5Sp.copyWith(
                                color: AppColors.goldenYellow,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: size.height / 50),
                            SizedBox(
                              width: 100.w,
                              height: 200.h,
                              child: SingleChildScrollView(
                                child: Table(
                                  border: TableBorder.all(
                                    color: AppColors.deepPurple,
                                    width: 1.5,
                                  ),
                                  columnWidths: {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        tableHeader('العدد'),
                                        tableHeader('نوع المحتوى'),
                                      ],
                                    ),
                                    ...List.generate(10, (_) {
                                      return TableRow(
                                        children: [
                                          tableCell('5'),
                                          tableCell('كتب'),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: size.height / 10),
                            CustomOkButton(
                              onTap: () {},
                              color: AppColors.goldenYellow,
                              label: 'حفظ',
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 700.h,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'انشاء طرد',
                                    textDirection: TextDirection.ltr,
                                    style: Styles.textStyle6Sp.copyWith(
                                      color: AppColors.goldenYellow,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 20),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.persons,
                                    ),
                                    hintText: 'اختيار العميل',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.outlineBox,
                                    ),
                                    hintText: 'رمز الشحنة',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.bulb,
                                    ),
                                    hintText: 'اختيار البلد المصدر',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.bulb,
                                    ),
                                    hintText: 'اختيار البلد الوجهة',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.persons,
                                    ),
                                    hintText: 'اختيار البائعين',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.aLetter,
                                    ),
                                    hintText: 'العلامة التجارية',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledIconTextField(
                                    svgPicture: SvgPicture.asset(
                                      AssetsData.outlineBox,
                                    ),
                                    hintText: 'طلب شحن',
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 110.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: CustomSwitchLabel(
                                      label: 'هش أم لا',
                                      textColor: AppColors.black.withValues(
                                        alpha: 0.4,
                                      ),
                                      activeColor: AppColors.goldenYellow,
                                      disableColor: AppColors.grayDark,
                                      isActive: true,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 110.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: CustomSwitchLabel(
                                      label: 'بحاجة لإعادة التعبئة أم لا',
                                      textColor: AppColors.black.withValues(
                                        alpha: 0.4,
                                      ),
                                      activeColor: AppColors.goldenYellow,
                                      disableColor: AppColors.grayDark,
                                      isActive: false,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Text(
                                    'رفع صورة الميزان:',
                                    style: Styles.textStyle5Sp,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 110.w,
                                    height: 180.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsData.camera,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Text(
                                    'المالية:',
                                    style: Styles.textStyle5Sp,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(height: size.height / 30),
                                  LabeledInputField(label: 'المبلغ المدفوع'),
                                  SizedBox(height: size.height / 30),
                                  LabeledInputField(label: 'عنوان العميل'),
                                  SizedBox(height: size.height / 30),
                                  SizedBox(
                                    width: 110.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 50.w,
                                          child: CustomOkButton(
                                            onTap: () {},
                                            color: AppColors.goldenYellow,
                                            label: 'حساب الأبعاد',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50.w,
                                          child: CustomOkButton(
                                            onTap: () {},
                                            color: AppColors.goldenYellow,
                                            label: 'حساب الحجم',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  CustomNote(label: 'ملاحظات عامة:'),
                                  SizedBox(height: size.height / 30),
                                  CustomNote(label: 'ملاحظات طباعة:'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

Widget tableHeader(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 12.h),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text(
      text,
      style: Styles.textStyle5Sp.copyWith(color: AppColors.goldenYellow),
      textDirection: TextDirection.rtl,
    ),
  );
}

Widget tableCell(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 12.h),
    alignment: Alignment.center,
    child: Text(
      text,
      style: Styles.textStyle5Sp.copyWith(color: AppColors.deepPurple),
      textDirection: TextDirection.rtl,
    ),
  );
}
