import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/Controllers/auth_controller.dart';
import 'package:tik_tok_clone/Controllers/profile_controller.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  final String uid;
  ProfileScreen({super.key, required this.uid});
  ProfileController profileController = Get.put(ProfileController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.person_add_alt_1_outlined),
        actions: [
          Row(
            children: [
              const Text(
                "Sign Out",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => authController.signOutFromFirebase(),
                child: const Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
        title: Text(
          profileController.user.name.toString(),
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            profileController.user.profilePhoto.toString()),
                      )
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
                  const Divider(),
                  SizedBox(
                    height: 400,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                      ),
                      itemCount: 4, // Number of items in the grid
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(
                                    20)), // Set the height to your desired value
                            width: 100, // Set the width to your desired value

                            child: Center(
                              child: Text('Item $index'),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
