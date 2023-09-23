import 'package:flutter/material.dart';

import 'package:tik_tok_clone/Constants/constants.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  const AppTextField({
    Key? key,
    required this.hintText,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: hintText,
        prefixIconColor: Colors.red,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: buttonColor), // Change the color here
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: greyColor), // Change the color here
        ),
      ),
    );
  }
}
