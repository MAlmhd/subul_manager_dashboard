import 'package:country_flags/country_flags.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';

class FlagCodeCountry extends StatelessWidget {
  const FlagCodeCountry({super.key, required this.code, required this.flag});
  final String code;
  final String flag;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CountryFlag.fromCountryCode(flag, width: 18.w, height: 40.h),
        SizedBox(width: size.width / 100),
        Text(
          code,
          style: Styles.textStyle5Sp,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
