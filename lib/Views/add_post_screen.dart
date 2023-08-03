import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Constants/constants.dart';
import 'confirm_screen.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});
  pickvideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);

    if (video != null) {
      Get.to(ConfirmScreen(
        videoFile: File(video.path),
        videoPath: video.path,
      ));
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickvideo(ImageSource.gallery, context);
                  },
                  child: const Row(children: [
                    Icon(Icons.image),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickvideo(ImageSource.camera, context);
                  },
                  child: const Row(children: [
                    Icon(Icons.camera),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Row(children: [
                    Icon(Icons.cancel),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          showOptionsDialog(context);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          height: 50.h,
          width: 1.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: buttonColor),
          child: const Center(child: Text('Add New Video')),
        ),
      )),
    );
  }
}
