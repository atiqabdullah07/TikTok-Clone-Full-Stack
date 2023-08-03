import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Models/user_model.dart';

class SearchControllers extends GetxController {
  RxList searchedUser = <User>[].obs;

  Future<void> searchUsers(String typedUser) async {
    try {
      log('Hello world');
      var books = FirebaseFirestore.instance.collection('users').where('name', isGreaterThanOrEqualTo: typedUser);
      books.get().then((snapshot) {
        searchedUser.clear();
        for (var element in snapshot.docs) {
          searchedUser.add(
            User(
              name: element.data()['name'],
              email: element.data()['email'],
              profilePhoto: element.data()['profilePhoto'],
              uid: element.data()['uid'],
            ),
          );
        }
      });
    } catch (e) {
      log('Catch Block of search User: ${e.toString()}');
    }
  }

  // searchedUser.bindStream(firestore
  //     .collection('users')
  //    
  //     .snapshots()
  //     .map((QuerySnapshot query) {
  //   List<User> retVal = [];
  //   for (var element in query.docs) {
  //     retVal.add(User.fromSnap(element));
  //   }
  //   return retVal;
  // }));
  // log(searchedUser.length.toString());
}
