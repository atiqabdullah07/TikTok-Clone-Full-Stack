import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/video_controller.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            await videoController.getData();
            log('Getting data: ${videoController.videosList}');
          },
          child: Container(
            width: 100,
            height: 50,
            color: Colors.teal,
            child: const Text('Click here'),
          ),
        ),
      ),
    );
  }
}
