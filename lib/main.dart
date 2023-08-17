import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tik_tok_clone/Views/home_screen.dart';
import 'package:tik_tok_clone/Views/testing.dart';

import 'Constants/constants.dart';
import 'Controller Bindings/controller_bindings.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
            initialBinding: ControllerBinding(),
            debugShowCheckedModeBanner: false,
            title: 'Tik Tok',
            theme: ThemeData.dark()
                .copyWith(scaffoldBackgroundColor: backgroundColor),
            home: HomeScreen(),
          )));
}
