import 'package:flutter/cupertino.dart';
import 'package:subul_manager_dashboard/core/widgets/enter_registeration_information.dart';
import 'package:subul_manager_dashboard/core/widgets/otp.dart';

class RegisterationClient extends StatelessWidget {
  const RegisterationClient({super.key, required this.onTap, required this.showOtp});
  final Function() onTap;
  final bool showOtp;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EnterRegisterationInformation(
          label: 'إدخال بيانات العميل',
          onTap: onTap,
        ),
        if(showOtp)
        OTP(),
      ],
    );
  }
}
