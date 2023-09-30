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
  List<String> images = [
    "https://images.unsplash.com/photo-1693813428836-de02bcda8888?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1695982207433-d5e11d6b2214?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.pexels.com/photos/18486578/pexels-photo-18486578/free-photo-of-city-road-restaurant-fashion.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/14619059/pexels-photo-14619059.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load"
  ];

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
              Text(
                "Sign Out",
                style: TextStyle(color: Colors.grey.shade700),
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
                            'Followers',
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
                    height: 500,
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
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      images[index].toString(),
                                    ),
                                    fit: BoxFit.cover),
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(
                                    20)), // Set the height to your desired value
                            width: 100,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                  child: Icon(
                                Icons.play_arrow,
                                size: 50,
                                color: Colors.white,
                              )),
                            ),
                            // Set the width to your desired value
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
