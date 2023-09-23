import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/Controllers/profile_controller.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  final String uid;
  ProfileScreen({super.key, required this.uid});
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: const Icon(Icons.person_add_alt_1_outlined),
        actions: const [Icon(Icons.more_horiz)],
        title: const Text(
          "Username",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   radius: 50,
                  //   backgroundImage: NetworkImage(
                  //       profileController.user.profilePhoto.toString()),
                  // )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(fontSize: 10.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Column(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Follower',
                        style: TextStyle(fontSize: 10.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Column(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Likes',
                        style: TextStyle(fontSize: 10.sp),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () {
                    profileController.getProfile();
                  },
                  child: Text(
                    'Sign Out',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
