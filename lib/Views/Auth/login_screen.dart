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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/Tiktok_Logo 1.png",
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      textEditingController: emailController,
                      hintText: 'Email',
                      icon: const Icon(Icons.email_outlined),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppTextField(
                      textEditingController: passwordController,
                      hintText: 'Password',
                      obsecureText: true,
                      icon: const Icon(Icons.lock_outline),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppButton(
                      onPressed: () async {
                        authController.loginUser(
                            emailController.text, passwordController.text);
                      },
                      title: 'Login',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an Account? ",
                  style: TextStyle(fontSize: 15),
                ),
                InkWell(
                    onTap: () {
                      Get.to(const SignUpScreen());
                    },
                    child: const Text(
                      'Regester Now',
                      style: TextStyle(color: buttonColor, fontSize: 15),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
