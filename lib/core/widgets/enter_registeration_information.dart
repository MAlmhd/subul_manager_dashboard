
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_text_field.dart';
import 'package:subul_manager_dashboard/core/widgets/upload_image.dart';

class EnterRegisterationInformation extends StatelessWidget {
  const EnterRegisterationInformation({super.key, required this.label, required this.onTap});
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.goldenYellow,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Center(
              child: Text(
                label,
                style: Styles.textStyle6Sp
              ),
            ),
          ),
        ),
        SizedBox(height: size.height / 12),
        CustomTextFiled(
          label: 'الاسم الأول :',
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: size.height / 70),
        CustomTextFiled(
          label: 'الاسم الأخير :',
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: size.height / 70),
        CustomTextFiled(
          label: 'العنوان  :',
          keyboardType: TextInputType.streetAddress,
        ),
        SizedBox(height: size.height / 70),
        CustomTextFiled(
          label: 'رقم الهاتف  :',
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: size.height / 70),
        CustomTextFiled(
          label: 'البريد الإلكتروني   :',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: size.height / 70),
        CustomTextFiled(
          label: 'كلمة المرور  :',
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: size.height / 70),
        CustomTextFiled(label: ' الجنس  :', keyboardType: TextInputType.text),
        SizedBox(height: size.height / 70),
        CustomTextFiled(
          label: ' الحالة المنطقة الزمنية  :',
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: size.height / 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UploadImage(label: 'أدخل صورة الهوية'),
            SizedBox(width: size.width / 120),
            UploadImage(label: 'أدخل صورتك الشخصية'),
          ],
        ),
        SizedBox(height: size.height / 20),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 60.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.goldenYellow,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              child: Center(
                child: Text(
                  'موافق',
                  style: Styles.textStyle4Sp.copyWith(color: AppColors.white,),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height / 20),
      ],
    );
  }
}
