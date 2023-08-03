import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/Controllers/video_controller.dart';

import 'package:video_compress/video_compress.dart';

import '../Constants/constants.dart';
import '../Models/video_model.dart';

class UploadController extends GetxController {
  final VideoController videoController = Get.put(VideoController());

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo!.file;
  }

  _uploadVideoToStorage(String id, File videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await videoPath);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> uploadVideo(
      String songName, String title, File videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      //get Id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage('video $len', videoPath);
      //  String thumbnail = await _uploadImageToStorage('video $len', videoPath);
      Video video = Video(
        username: (userDoc.data() as Map<String, dynamic>)['name'],
        uid: uid,
        id: 'video $len',
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        title: title,
        videoPath: videoUrl,
        thumbnailPath: 'thumbnail',
        profilePath: (userDoc.data() as Map<String, dynamic>)['profilePhoto'],
      );
      await firestore
          .collection('videos')
          .doc('video $len')
          .set(video.toJason());
      Get.back();
      await videoController.getData();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      log('Catch block of uploadController: ${e.toString()}');
    }
  }
}
