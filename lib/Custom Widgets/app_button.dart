import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/constants.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  //get buttonColor => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45.h,
        decoration: const BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
