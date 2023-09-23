// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import '../Constants/constants.dart';
import '../Controllers/comments_controller.dart';
import '../Controllers/video_controller.dart';
import '../Custom Widgets/circle_animation.dart';
import '../Custom Widgets/video_payer.dart';
import 'comments_screen.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Color likeButton = Colors.white;

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
            var Videolikes = videoController.videosList[index].likes;
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
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      videoController.videosList[index].title,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
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
                                              color: Colors.white,
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
                                Container(
                                  height: 230,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                        0.1), // Adjust opacity for glass effect
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 20,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5,
                                          sigmaY: 5), // Adjust blur intensity
                                      child: Container(
                                        color: Colors.white.withOpacity(0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {},
                                                child: Column(
                                                  children: [
                                                    LikeButton(
                                                      size: 42,
                                                      likeBuilder: (isLiked) {
                                                        return Icon(
                                                          Icons.favorite,
                                                          size: 40,
                                                          color: isLiked
                                                              ? buttonColor
                                                              : Colors.white,
                                                        );
                                                      },
                                                      onTap: (isLiked) async {
                                                        String uid =
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid;
                                                        Videolikes.contains(uid)
                                                            ? setState(() {
                                                                Videolikes
                                                                    .remove(
                                                                        uid);
                                                              })
                                                            : setState(
                                                                () {
                                                                  Videolikes
                                                                      .add(uid);
                                                                },
                                                              );

                                                        videoController
                                                            .likeVideo(
                                                                videoController
                                                                    .videosList[
                                                                        index]
                                                                    .id);

                                                        return true;
                                                      },
                                                      isLiked: videoController
                                                              .videosList[index]
                                                              .likes
                                                              .contains(
                                                                  FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid)
                                                          ? true
                                                          : false,
                                                    ),
                                                    Text(
                                                      videoController
                                                          .videosList[index]
                                                          .likes
                                                          .length
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
                                                  showModalBottomSheet(
                                                      isScrollControlled: false,
                                                      isDismissible: true,
                                                      backgroundColor: Colors
                                                          .black
                                                          .withOpacity(0),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          40),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          40)),
                                                              color:
                                                                  Colors.white),
                                                          child: CommentsScreen(
                                                            commentsCount:
                                                                videoController
                                                                    .videosList[
                                                                        index]
                                                                    .commentCount
                                                                    .toString(),
                                                            profilePix:
                                                                videoController
                                                                    .videosList[
                                                                        index]
                                                                    .profilePath,
                                                            id: videoController
                                                                .videosList[
                                                                    index]
                                                                .id,
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/comments.svg",
                                                      color: Colors.white,
                                                      width: 30.r,
                                                    ),
                                                    Text(
                                                      videoController
                                                          .videosList[index]
                                                          .commentCount
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
                                                      videoController
                                                          .videosList[index]
                                                          .id);
                                                },
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/share.svg",
                                                      color: Colors.white,
                                                      width: 30.r,
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
                                            ],
                                          ),
                                        ), // Adjust opacity for glass effect
                                        // Replace with your content
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 30,
                                  child: CircleAnimation(
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              videoController.videosList[index]
                                                  .profilePath))),
                                )
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
