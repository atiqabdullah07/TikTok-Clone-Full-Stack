 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  get buttonColor => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        height: 45.h,
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 15.sp),
        )),
      ),
    );
  }
}
