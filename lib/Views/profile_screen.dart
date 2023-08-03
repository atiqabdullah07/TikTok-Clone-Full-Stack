import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  final String uid;
  const ProfileScreen({super.key, required this.uid});

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
                  ClipOval(
                      child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: '',
                    height: 100.h,
                    width: 100.w,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ))
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   radius: 50.r,
                  //   backgroundImage: Network,
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
              ),SizedBox(height: 20.h,),
              Text('Sign Out',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp ),)
            ],
          )
        ]),
      ),
    );
  }
}
