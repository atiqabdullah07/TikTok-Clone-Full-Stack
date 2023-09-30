import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:tik_tok_clone/Models/user_model.dart' as model;

import '../Constants/constants.dart';
import '../Views/Auth/login_screen.dart';
import '../Views/home_screen.dart';

class AuthController extends GetxController {
  String imageUrl = '';
  late Rx<User?> user;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(firebaseAuth.currentUser);
    user.bindStream(firebaseAuth.authStateChanges());
    //  print("Yes");
    ever(user, setInitialScreen);
  }

  setInitialScreen(User? user) {
    //  print("Current User is: $user");
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future<void> signOutFromFirebase() async {
    try {
      await FirebaseAuth.instance.signOut();
      //  print('Signed out');
    } catch (e) {
      //   print('Error signing out: $e');
    }
  }

  //Upload the Profile Picture
  Future<void> uploadToStorage(File image) async {
    try {
      final imgId = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = FirebaseStorage.instance.ref('Profile Pics');
      final imgRef = storageRef.child('path_$imgId');
      var uploadTask = imgRef.putFile(image);

      try {
        // Wait for the upload to complete
        await uploadTask;

        // Once the upload is complete, get the download URL
        var url = await imgRef.getDownloadURL();
        imageUrl = url;
      } catch (error) {
        //   print("Error uploading image: $error");
      }
    } catch (e) {
      log('Catch Block of uploadFile: ${e.toString()}');
    }
  }

  // Regester the user
  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      easyLoading();
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        signOutFromFirebase();

        await uploadToStorage(image);
        log('Picked Image Url $imageUrl');

        model.User user = model.User(
            email: email,
            name: username,
            profilePhoto: imageUrl,
            uid: cred.user!.uid);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        EasyLoading.dismiss();
        Get.to(LoginScreen());
        Get.snackbar('User', 'Added Successfully');
        log('User Added Successfully');
      } else {
        EasyLoading.dismiss();
        Get.snackbar('Error', 'Please Enter all the Information');
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', e.toString());
      log('Catch Block of RegisterUser: ${e.toString()}');
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      easyLoading();
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        // ignore: unnecessary_null_comparison
        if (user != null) {
          EasyLoading.dismiss();
          Get.to(const HomeScreen());
        }
      } else {
        EasyLoading.dismiss();

        Get.snackbar('Error', 'Please Enter both username and password');
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', "Wrong Password, Try Again!");
      log('Catch Block of Login User: ${e.toString()}');
    }
  }
}
