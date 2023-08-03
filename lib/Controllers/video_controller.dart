import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';
import '../Models/video_model.dart';

class VideoController extends GetxController {
  // final RxList<Video> _videoList = RxList([]);
  // List<Video> get videoList => _videoList.value;
  RxList videosList = <Video>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    try {
      var books = FirebaseFirestore.instance.collection('videos');
      books.get().then((snapshot) {
        videosList.clear();
        for (var element in snapshot.docs) {
          videosList.add(Video(
            id: element.reference.id,
            title: element.data()['caption'],
            commentCount: element.data()['commentCount'],
            likes: element['likes'],
            profilePath: element.data()['profilePhoto'],
            shareCount: element.data()['shareCount'],
            songName: element.data()['songName'],
            thumbnailPath: '',
            uid: element.data()['uid'],
            username: element.data()['username'],
            videoPath: element.data()['videoPath'],
          ));
        }
      });
    } catch (e) {
      log('Catch Block of getData: ${e.toString()}');
    }
  }

  Future<void> likeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = firebaseAuth.currentUser!.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
    await getData();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   _videoList.bindStream(
  //       firestore.collection('videos').snapshots().map((QuerySnapshot query) {
  //     List<Video> retVal = [];
  //     for (var element in query.docs) {
  //       retVal.add(Video.fromSnap(element));
  //     }
  //       return retVal;
  //   }

  //   ));
  // }
}
