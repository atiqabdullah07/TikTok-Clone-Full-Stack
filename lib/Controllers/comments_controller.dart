import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:tik_tok_clone/Controllers/video_controller.dart';

import '../Constants/constants.dart';
import '../Models/comments_mode.dart';

class CommentsController extends GetxController {
  final VideoController videoController = Get.put(VideoController());
  RxList commentsList = <Comment>[].obs;
  String _postId = '';

  updatePostId(String id) {
    _postId = id;
    getComment(id);
  }

  getComment(String id) async {
    try {
      var books = FirebaseFirestore.instance
          .collection('videos')
          .doc(id)
          .collection('comments');
      books.get().then((snapshot) {
        commentsList.clear();
        for (var element in snapshot.docs) {
          commentsList.add(Comment(
            username: element.data()['username'],
            comment: element.data()['comment'],
            // date: element.data()['date'],
            likes: element['likes'],
            profilePhoto: element.data()['profilePhoto'],
            uid: element.data()['uid'],
            id: element.reference.id,
          ));
        }
      }).then((value) {
        log(id);
        log(commentsList.length.toString());
      });
    } catch (e) {
      log('Catch Block of Get Comment: ${e.toString()}');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // await getComment();
  }

  Future<void> postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        DocumentSnapshot userDoc = await firestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .get();

        var allDocs = await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .get();

        int len = allDocs.docs.length;

        var comments = FirebaseFirestore.instance
            .collection('videos')
            .doc(_postId)
            .collection('comments');
        comments.add({
          'username': (userDoc.data()! as dynamic)['name'],
          'comment': commentText,
          'date': DateTime.now(),
          'likes': [],
          'profilePhoto': (userDoc.data()! as dynamic)['profilePhoto'],
          'uid': firebaseAuth.currentUser!.uid,
          'id': 'Comment $len'
        }).then((value) async {
          await getComment(_postId);
          await videoController.getData();
        });
        DocumentSnapshot doc =
            await firestore.collection('videos').doc(_postId).get();
        await firestore.collection('videos').doc(_postId).update({
          'commentCount': (doc.data()! as dynamic)['commentCount'] + 1,
        });
      } else {
        Get.snackbar('Error', 'Enter a Comment');
      }
    } catch (e) {
      log('Catch Block of Post Comment: ${e.toString()}');
    }
  }

  likeComment(String id) async {
    log('Hello world');
    log(_postId);
    log(id);
    DocumentSnapshot doc = await firestore
        .collection('videos')
        .doc(_postId)
        .collection('comments')
        .doc(id)
        .get();

    if ((doc.data()! as dynamic)['likes']
        .contains(firebaseAuth.currentUser!.uid)) {
      firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayRemove([firebaseAuth.currentUser!.uid])
      });
    } else {
      await firestore
          .collection('videos')
          .doc(_postId)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayUnion([firebaseAuth.currentUser!.uid])
      });
    }
    await getComment(_postId);
  }
}
