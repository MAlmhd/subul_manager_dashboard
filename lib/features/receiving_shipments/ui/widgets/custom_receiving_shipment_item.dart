import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/flag_code_country.dart';

class CustomReceivingShipmentItem extends StatelessWidget {
  const CustomReceivingShipmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 300.w,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.5,
              height: size.height / 11,
              decoration: BoxDecoration(
                color: AppColors.lightGray2,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: size.width / 60),
                  FlagCodeCountry(code: '+963', flag: 'GB'),
                  SizedBox(width: size.width / 10),
                  FlagCodeCountry(code: '+963', flag: 'GB'),
                  SizedBox(width: size.width / 10),
                  Text(
                    '4',
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(width: size.width / 7),
                  Flexible(
                    child: Text(
                      '24/2/2025',
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(width: size.width / 10),
                  Flexible(
                    child: Text(
                      '7575757577',
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: size.width / 60),
          SvgPicture.asset(AssetsData.box, width: 15.w),
        ],
      ),
    );
  }
}
