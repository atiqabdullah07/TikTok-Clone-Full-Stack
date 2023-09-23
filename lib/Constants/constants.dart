import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

const backgroundColor = Colors.black;

const buttonColor = Color(0xFFFF305D);
const greyColor = Color(0xFFA8A8A8);
const hintTextColor = Color(0xFFBABABA);
const borderColor = Colors.grey;

//FireBase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
