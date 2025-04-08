import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class DetailsOfBill extends StatelessWidget {
  const DetailsOfBill({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: 300.w,
        height: 600.h,
        decoration: BoxDecoration(
          color: AppColors.lightGray2,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(':ملف الفاتورة', style: Styles.textStyle5Sp),
                  SizedBox(width: size.width / 60),
                  CircleAvatar(
                    maxRadius: 5.w,
                    backgroundColor: AppColors.deepPurple,
                    child: Icon(Icons.credit_card, color: AppColors.white),
                  ),
                ],
              ),
              SizedBox(height: size.height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImageView(
                        data: '1234567890',
                        version: QrVersions.auto,
                        size: size.width / 5,
                      ),
                      SizedBox(height: size.height / 20),
                      Text('كود الاستلام', style: Styles.textStyle5Sp),
                      SizedBox(height: size.height / 20),
                      Container(
                        width: 70.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '5 طرود',
                                textDirection: TextDirection.rtl,
                                style: Styles.textStyle4Sp,
                              ),
                              SizedBox(width: size.width / 70),
                              SvgPicture.asset(
                                AssetsData.purbleBox,
                                width: 7.w,
                              ),
                              SizedBox(width: size.width / 50),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 20),
                      Container(
                        width: 70.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'اسم المورد : حسام',
                                textDirection: TextDirection.rtl,
                                style: Styles.textStyle4Sp,
                              ),
                              SizedBox(width: size.width / 70),
                              Icon(
                                Icons.person_outline_sharp,
                                size: 9.w,
                                color: AppColors.deepPurple,
                              ),
                              SizedBox(width: size.width / 50),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Text(
                            'تم تحديد موعد التسليم 22/7/2024',
                            style: Styles.textStyle4Sp,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 30),
                      Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Text(
                            '200 \$ مئتان دولار',
                            style: Styles.textStyle4Sp,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 30),
                      Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Text(
                            'رقم الاستلام: 5224',
                            style: Styles.textStyle4Sp,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 30),
                      Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Text(
                            'اسم العميل : محمد ابراهيم المحمود',
                            style: Styles.textStyle4Sp,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 30),
                      Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                        child: Center(
                          child: Text(
                            'رقم العميل : 45725272425',
                            style: Styles.textStyle4Sp,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 10),
                      Text(
                        'اسم المستلم : محمد المحمود ',
                        style: Styles.textStyle5Sp,
                      ),
                      SizedBox(height: size.height / 10),
                      Text('توقيع المستلم : محمد', style: Styles.textStyle5Sp),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
