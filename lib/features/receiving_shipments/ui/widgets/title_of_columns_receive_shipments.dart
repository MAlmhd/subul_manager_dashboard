import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';

class TitleOfColumnsReceiveShipments extends StatelessWidget {
  const TitleOfColumnsReceiveShipments({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 300.w,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: Text(
              'رمز البلد الوجهة',
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(width: size.width / 16),
          SizedBox(
            width: 40.w,
            child: Text(
              'رمز البلد المصدر',
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(width: size.width / 16),
          SizedBox(
            width: 40.w,
            child: Text(
              'عدد الطرود',
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(width: size.width / 16),
          SizedBox(
            width: 40.w,
            child: Text(
              'تاريخ الإرسال',
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(width: size.width / 16),
          SizedBox(
            width: 30.w,
            child: Text(
              'كود الشحنة',
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
