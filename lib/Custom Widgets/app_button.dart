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
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Center(
            child: Text(
          " title",
          style: TextStyle(
              fontSize: 1.sp, color: Colors.black, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
