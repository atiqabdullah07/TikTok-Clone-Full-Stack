import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:tik_tok_clone/Models/user_model.dart';

import '../Constants/constants.dart';

class ProfileController extends GetxController {
  late User user;

  @override
  void onInit() async {
    super.onInit();
    await getProfile();
  }

  Future<void> getProfile() async {
    try {
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get();

      user = User(
        name: userDoc["name"],
        profilePhoto: userDoc["profilePhoto"],
      );

      print(user.profilePhoto);
    } catch (e) {
      log(e.toString());
    }
  }
}
