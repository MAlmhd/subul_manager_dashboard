
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowErrorMessage extends StatelessWidget {
  const ShowErrorMessage({super.key, required this.message, required this.onPressed});
  final String message;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(color: Colors.red, fontSize: 7.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}
