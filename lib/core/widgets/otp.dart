
import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/enter_one_digit_number_widget.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(),
        ),
        Column(
          children: [
            Container(
              width: 150.w,
              height: 380.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'رقم الجوال',
                    style: Styles.textStyle7Sp.copyWith(color: AppColors.deepPurple,),
                  ),
                  SizedBox(height: size.height / 14),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: size.width / 20,
                            maxHeight: size.height / 20,
                          ),
                          child: SvgPicture.asset(
                            AssetsData.phoneNumber,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: size.width / 80),
                        Expanded(
                          child: Container(
                            height: size.height / 13,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  // spreadRadius: 1,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: CountryCodePicker(
                                    onChanged: print,
                                    initialSelection: 'SA',
                                    showFlag: true,
                                    showFlagMain: true,
                                    showDropDownButton: false,
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: true,
                                    textStyle: TextStyle(fontSize: 0.sp),
                                    alignLeft: false,
                                  ),
                                ),

                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'رمز التحقق',
                        style: Styles.textStyle4Sp
                      ),
                      SizedBox(width: size.width / 60),
                      SvgPicture.asset(AssetsData.lockIcon),
                    ],
                  ),
                  SizedBox(height: size.height / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EnterOneDigitNumberWidget(),
                      SizedBox(width: size.width / 60),
                      EnterOneDigitNumberWidget(),
                      SizedBox(width: size.width / 60),
                      EnterOneDigitNumberWidget(),
                      SizedBox(width: size.width / 60),
                      EnterOneDigitNumberWidget(),
                    ],
                  ),
                  SizedBox(height: size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '9.00',
                        style: Styles.textStyle4Sp
                      ),
                      SizedBox(width: size.width / 60),
                      Container(
                        width: 60.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.deepPurple,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(cornerRadius),
                          gradient: LinearGradient(
                            colors: [AppColors.lightGray, AppColors.mediumGray],
                            stops: [0.0, 1.0],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'إعادة الحصول على الرمز',
                            style: Styles.textStyle4Sp.copyWith(color: AppColors.deepPurple,fontWeight: FontWeight.w900,)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 40),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 90.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.goldenYellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'تحقق',
                      style: Styles.textStyle4Sp.copyWith(color: AppColors.white)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
