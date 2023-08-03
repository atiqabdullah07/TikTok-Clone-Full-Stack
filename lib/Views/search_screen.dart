import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/Views/profile_screen.dart';

import '../Controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchTextController = TextEditingController();

  final SearchControllers searchController = Get.put(SearchControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  // onFieldSubmitted: (value) =>
                  //     searchController.searchUsers(value),
                  onChanged: ((value) {
                    searchController.searchUsers(value);
                  }),
                  controller: searchTextController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                )),
                Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.red),
                    child: IconButton(
                        onPressed: () {
                          searchController
                              .searchUsers(searchTextController.text);
                        },
                        icon: const Icon(Icons.search)))
              ],
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
      }),
    );
  }
}
