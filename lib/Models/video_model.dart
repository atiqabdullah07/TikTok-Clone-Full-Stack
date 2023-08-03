import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  final String username;
  final String uid;
  final String id;
  final List likes;
  final int commentCount;
  final int shareCount;
  final String songName;
  final String title;
  final String videoPath;
  final String thumbnailPath;
  final String profilePath;

  Video(
      {required this.username,
      required this.uid,
      required this.id,
      required this.likes,
      required this.commentCount,
      required this.shareCount,
      required this.songName,
      required this.title,
      required this.videoPath,
      required this.thumbnailPath,
      required this.profilePath});

  Map<String, dynamic> toJason() => {
        "username": username,
        "uid": uid,
        "profilePhoto": profilePath,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "songName": songName,
        "caption": title,
        "videoPath": videoPath,
        "thumbnail": thumbnailPath
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['profilePhoto'],
      likes: snapshot['id'],
      commentCount: snapshot['likes'],
      shareCount: snapshot['commentCount'],
      songName: snapshot['shareCount'],
      title: snapshot['songName'],
      videoPath: snapshot['caption'],
      thumbnailPath: snapshot['videoPath'],
      profilePath: snapshot['thumbnail'],
    );
  }
}
