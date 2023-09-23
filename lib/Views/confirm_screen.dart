import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

import '../Controllers/upload_video_controller.dart';
import '../Custom Widgets/app_button.dart';
import '../Custom Widgets/custom_textfield.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final UploadController uploadController = Get.put(UploadController());
  final TextEditingController songController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: VideoPlayer(controller),
          ),
          SizedBox(
            height: 30.h,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    textEditingController: songController,
                    hintText: 'Song Name',
                    icon: const Icon(Icons.music_video_outlined),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextField(
                    textEditingController: titleController,
                    hintText: 'Title',
                    icon: const Icon(Icons.description),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppButton(
                      title: 'Share',
                      onPressed: () {
                        uploadController.uploadVideo(songController.text,
                            titleController.text, widget.videoFile);
                      }),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
