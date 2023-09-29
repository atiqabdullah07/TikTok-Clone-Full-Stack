import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';
import '../Controllers/comments_controller.dart';

class CommentsScreen extends StatelessWidget {
  final String id;
  final String profilePix;
  final String commentsCount;
  CommentsScreen(
      {super.key,
      required this.id,
      required this.commentsCount,
      required this.profilePix});
  final TextEditingController commentsTextController = TextEditingController();
  final CommentsController commentsController = Get.put(CommentsController());

  @override
  Widget build(BuildContext context) {
    commentsController.updatePostId(id);
    return SingleChildScrollView(
      child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 6,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  "Comments",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 350,
                child: Expanded(
                  child: Obx(() {
                    return ListView.builder(
                        itemCount: commentsController.commentsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(commentsController
                                  .commentsList[index].profilePhoto
                                  .toString()),
                            ),
                            title: Row(children: [
                              Text(
                                  commentsController
                                      .commentsList[index].username,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: greyColor,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                width: 10.w,
                              ),
                            ]),
                            subtitle: Row(children: [
                              Text(
                                  commentsController
                                      .commentsList[index].comment,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                width: 20.w,
                              ),
                            ]),
                            trailing: InkWell(
                                onTap: () {
                                  commentsController.likeComment(
                                      commentsController
                                          .commentsList[index].id);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: commentsController
                                              .commentsList[index].likes
                                              .contains(
                                                  firebaseAuth.currentUser!.uid)
                                          ? buttonColor
                                          : Colors.grey.shade300,
                                      size: 20.r,
                                    ),
                                    Text(
                                        commentsController
                                            .commentsList[index].likes.length
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                        )),
                                  ],
                                )),
                          );
                        });
                  }),
                ),
              ),
              const Divider(),
              ListTile(
                horizontalTitleGap: 0,
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(profilePix),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(0xFFF5F5F5),
                    ),
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            cursorColor: Colors.black,
                            controller: commentsTextController,
                            decoration: InputDecoration(
                              hintText: "Send your comment...",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          commentsController
                              .postComment(commentsTextController.text);
                          commentsTextController.clear();
                        },
                        child: const CircleAvatar(
                          backgroundColor: buttonColor,
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
