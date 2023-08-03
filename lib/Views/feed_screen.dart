import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';
import '../Controllers/comments_controller.dart';
import '../Controllers/video_controller.dart';
import '../Custom Widgets/circle_animation.dart';
import '../Custom Widgets/video_payer.dart';
import 'comments_screen.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});
  final VideoController videoController = Get.put(VideoController());
  final CommentsController commentsController = Get.put(CommentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videoController.videosList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemBuilder: (context, index) {
            // final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                    videoUrl: videoController.videosList[index].videoPath),
                Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              // color: Colors.red,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      videoController
                                          .videosList[index].username,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      videoController.videosList[index].title,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.music_note,
                                          color: Colors.white,
                                          size: 20.r,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          videoController
                                              .videosList[index].songName,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: 0.25.sh),
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 50.w,
                                  height: 55.h,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 25.r,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            videoController
                                                .videosList[index].profilePath),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: CircleAvatar(
                                          backgroundColor: buttonColor,
                                          radius: 10.r,
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 15.r,
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    videoController.likeVideo(
                                        videoController.videosList[index].id);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: videoController
                                                .videosList[index].likes
                                                .contains(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            ? Colors.red
                                            : Colors.white,
                                        size: 35.r,
                                      ),
                                      Text(
                                        videoController
                                            .videosList[index].likes.length
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      CommentsScreen(
                                        id: videoController
                                            .videosList[index].id,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        color: Colors.white,
                                        size: 35.r,
                                      ),
                                      Text(
                                        videoController
                                            .videosList[index].commentCount
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    commentsController.getComment(
                                        videoController.videosList[index].id);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.reply,
                                        color: Colors.white,
                                        size: 35.r,
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CircleAnimation(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                            videoController.videosList[index]
                                                .profilePath)))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          });
    }));
  }
}
