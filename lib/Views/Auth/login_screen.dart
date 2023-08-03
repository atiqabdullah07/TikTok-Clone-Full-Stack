import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/Views/Auth/signup_screen.dart';

import '../../Constants/constants.dart';
import '../../Controllers/auth_controller.dart';
import '../../Custom Widgets/app_button.dart';
import '../../Custom Widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tic Tok Colne',
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Login',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextField(
                    textEditingController: emailController, hintText: 'Email'),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                    textEditingController: passwordController,
                    hintText: 'Password'),
                SizedBox(
                  height: 10.h,
                ),
                AppButton(
                  onPressed: () async {
                    authController.loginUser(
                        emailController.text, passwordController.text);
                  },
                  title: 'Login',
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account? "),
                    InkWell(
                        onTap: () {
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          'Regester Now',
                          style: TextStyle(color: buttonColor),
                        ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
