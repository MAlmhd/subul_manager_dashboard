
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';

class NameOfColumnsInShowAllShipmentsTable extends StatelessWidget {
  const NameOfColumnsInShowAllShipmentsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
        children: [
          SizedBox(
            width: 60.w,
            child: Text(
              'عدد العناصر في الطرد',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              'العرض',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              'الطول',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              'الارتفاع',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'الحجمي العادي',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'الحجمي الخاص',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'الفعلي العادي',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'الفعلي الخاص',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'الوزن الفعلي',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'رقم الطرد',
              textAlign: TextAlign.center,
              style: Styles.textStyle6Sp,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              'العميل',
              textAlign: TextAlign.center,
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
