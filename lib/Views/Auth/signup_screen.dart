import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants/constants.dart';
import '../../Controllers/auth_controller.dart';
import '../../Custom Widgets/app_button.dart';
import '../../Custom Widgets/custom_textfield.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController authController = Get.put(AuthController());

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  File? pickedImage;

  Future pickImage() async {
    final XFile? tempimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempimage!.path);
    });

    log(pickedImage.toString());

    //imagePath = image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
            ),
            Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Stack(
                      children: [
                        pickedImage != null
                            ? CircleAvatar(
                                radius: 60.r,
                                backgroundColor: Colors.white,
                                backgroundImage: FileImage(pickedImage!),
                              )
                            : CircleAvatar(
                                radius: 60.r,
                                backgroundColor: Colors.white,
                                backgroundImage: const NetworkImage(
                                    'https://www.logolynx.com/images/logolynx/03/039b004617d1ef43cf1769aae45d6ea2.png'),
                              ),
                        Positioned(
                          bottom: 0,
                          left: 80.w,
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: const CircleAvatar(
                              backgroundColor: buttonColor,
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextField(
                      textEditingController: usernameController,
                      hintText: 'Username',
                      icon: const Icon(Icons.person_2_outlined),
                    ),
                    SizedBox(
                      height: 10.h,
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
                      icon: const Icon(Icons.lock_outline),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppButton(
                      onPressed: () {
                        authController.registerUser(
                            usernameController.text,
                            emailController.text,
                            passwordController.text,
                            pickedImage);
                      },
                      title: 'Sign Up',
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ",
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: buttonColor, fontSize: 15),
                            ))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
