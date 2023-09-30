import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/Views/profile_screen.dart';

import '../Constants/constants.dart';
import '../Controllers/search_controller.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchTextController = TextEditingController();

  final SearchControllers searchController = Get.put(SearchControllers());
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      onChanged: ((value) {
                        searchController.searchUsers(value);
                      }),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      cursorColor: Colors.black,
                      controller: searchTextController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: hintTextColor),
                        prefixIcon: Icon(
                          Icons.search,
                          color: _isFocused ? buttonColor : greyColor,
                        ),
                        hintText: "Search",
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(color: buttonColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(color: greyColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: searchController.searchedUser.length,
            itemBuilder: (context, index) {
              // User user = searchController.searchedUser[index];
              return InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Get.to(ProfileScreen(
                        uid: searchController.searchedUser[index].uid));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          searchController.searchedUser[index].profilePhoto),
                    ),
                    title: Text(searchController.searchedUser[index].name),
                  ),
                ),
              );
            }),
      );
    });
  }
}
