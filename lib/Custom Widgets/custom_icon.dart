import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      height: 30.w,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 38.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 38.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7)),
          ),
          Center(
            child: Container(
              width: 38.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: backgroundColor,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
