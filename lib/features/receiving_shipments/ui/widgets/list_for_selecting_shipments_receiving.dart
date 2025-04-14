import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/select_receiving_shipments_item.dart';

class ListForSelectingShipmentsReceiving extends StatelessWidget {
  const ListForSelectingShipmentsReceiving({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130.w,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Expanded(
                  child: Text(
                    'العميل',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Expanded(
                  child: Text(
                    'تاريخ الإرسال',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Expanded(
                  child: Text(
                    'رمز العميل',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 50),
          SizedBox(
            height: 500.h,
            width: 200.w,
            child: ListView.builder(
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: SelectReceivingShipmentsItem(),
                  ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
