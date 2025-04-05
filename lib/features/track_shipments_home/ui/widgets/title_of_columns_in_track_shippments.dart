import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';

class TitleOfColumnsInTrackShippments extends StatelessWidget {
  const TitleOfColumnsInTrackShippments({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 290.w,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: size.width / 20),
          Flexible(child: Text('نوع الشحن', style: Styles.textStyle6Sp)),
          SizedBox(width: size.width / 16),
          Flexible(child: Text('حالة الشحنة', style: Styles.textStyle6Sp)),
          SizedBox(width: size.width / 16),
          Flexible(child: Text('عدد الطرود', style: Styles.textStyle6Sp)),
          SizedBox(width: size.width / 16),
          Flexible(child: Text('العميل', style: Styles.textStyle6Sp)),
          SizedBox(width: size.width / 16),
          Flexible(child: Text('كود الشحنة', style: Styles.textStyle6Sp)),
        ],
      ),
    );
  }
}
