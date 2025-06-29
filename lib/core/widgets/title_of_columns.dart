
import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';

class TitleOfColumns extends StatelessWidget {
  const TitleOfColumns({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(width: size.width / 8),
        Flexible(child: Text('حالة الشحنة', style: Styles.textStyle6Sp)),
        SizedBox(width: size.width / 16),
        Flexible(child: Text('عدد الطرود', style: Styles.textStyle6Sp)),
        SizedBox(width: size.width / 16),
        Flexible(child: Text('العميل', style: Styles.textStyle6Sp)),
        SizedBox(width: size.width / 16),
        Flexible(child: Text('كود الشحنة', style: Styles.textStyle6Sp)),
        SizedBox(width: size.width / 20),
      ],
    );
  }
}
