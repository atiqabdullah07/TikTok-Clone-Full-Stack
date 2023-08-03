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
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? pickedImage;
  Future pickImage() async {
    final XFile? tempimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedImage = File(tempimage!.path);
    log(pickedImage.toString());

    //imagePath = image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
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
                  'Sign Up',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70.r,
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                    ),
                    Positioned(
                        bottom: -10,
                        left: 100.w,
                        child: IconButton(
                          onPressed: () {
                            pickImage();
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30.r,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextField(
                    textEditingController: usernameController,
                    hintText: 'Username'),
                SizedBox(
                  height: 10.h,
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
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account "),
                    InkWell(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          'Login',
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
