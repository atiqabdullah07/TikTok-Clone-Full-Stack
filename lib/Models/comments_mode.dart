import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Comment {
  String username;
  String comment;
 // final date;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  Comment(
      {required this.username,
      required this.comment,
    // required this.date,
      required this.likes,
      required this.profilePhoto,
      required this.uid,
      required this.id});

  Map<String, dynamic> toJason() => {
        'username': username,
        'comment': comment,
       //  'date': date,
        'likes': likes,
        'profilePhoto': profilePhoto,
        'uid': uid,
        'id': IdleScrollActivity
      };

  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(
      username: snapshot['username'],
      comment: snapshot['comment'],
     // date: snapshot['date'],
      likes: snapshot['likes'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      id: snapshot['id'],
    );
  }
}
