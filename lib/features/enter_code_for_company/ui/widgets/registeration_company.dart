
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:subul_manager_dashboard/core/widgets/otp.dart';

class RegisterationCompany extends StatelessWidget {
  const RegisterationCompany({super.key, required this.onTap, required this.showOtp});
  final Function() onTap;
  final bool showOtp ;

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        // EnterRegisterationInformation(
        //   label: 'إدخال بيانات الشركة',
        //   onTap: onTap,
        // ),
        if(showOtp)
        OTP(),
      ],
    );
  }
}
