import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_clone/Custom%20Widgets/app_button.dart';

import 'confirm_screen.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppButton(
            onPressed: () {
              showOptionsDialog(context);
            },
            title: 'Add Video',
          ),
        ),
      ),
    );
  }
}
