import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';
import '../Controllers/comments_controller.dart';
import '../Custom Widgets/custom_textfield.dart';

class CommentsScreen extends StatelessWidget {
  final String id;
  CommentsScreen({super.key, required this.id});
  final TextEditingController commentsTextController = TextEditingController();
  final CommentsController commentsController = Get.put(CommentsController());

  @override
  Widget build(BuildContext context) {
    commentsController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              children: [
                Expanded(
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
                                      color: buttonColor,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                  commentsController
                                      .commentsList[index].comment,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))
                            ]),
                            subtitle: Row(children: [
                              Text('Date',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text('Time',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                  '${commentsController.commentsList[index].likes.length} Likes',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  )),
                            ]),
                            trailing: InkWell(
                                onTap: () {
                                  commentsController.likeComment(
                                      commentsController
                                          .commentsList[index].id);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: commentsController
                                          .commentsList[index].likes
                                          .contains(
                                              firebaseAuth.currentUser!.uid)
                                      ? buttonColor
                                      : Colors.white,
                                  size: 20.r,
                                )),
                          );
                        });
                  }),
                ),
                const Divider(),
                ListTile(
                  minLeadingWidth: 0,
                  title: AppTextField(
                    hintText: 'Comment',
                    textEditingController: commentsTextController,
                  ),
                  trailing: InkWell(
                    onTap: () {
                      commentsController
                          .postComment(commentsTextController.text);
                      commentsTextController.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: buttonColor,
                      size: 30.r,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
