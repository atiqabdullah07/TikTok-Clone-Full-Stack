// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tik_tok_clone/Views/profile_screen.dart';
import 'package:tik_tok_clone/Views/search_screen.dart';

import 'add_post_screen.dart';
import 'feed_screen.dart';
import 'message_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    FeedScreen(),
    SearchScreen(),
    const AddPost(),
    MessageScreen(),
    ProfileScreen(
      uid: FirebaseAuth.instance.currentUser!.uid,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: ((value) {
              setState(() {
                currentIndex = value;
              });
            }),
            elevation: 10,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: currentIndex == 0 ? Colors.red : Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    color: currentIndex == 1 ? Colors.red : Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icons/add.png",
                    width: 60,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: currentIndex == 3 ? Colors.red : Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/user.svg",
                    color: currentIndex == 4 ? Colors.red : Colors.white,
                  ),
                  label: '')
            ]),
      ),
    );
  }
}
