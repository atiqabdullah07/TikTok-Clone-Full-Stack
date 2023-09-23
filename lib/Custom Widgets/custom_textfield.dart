import 'package:flutter/material.dart';
import 'package:tik_tok_clone/Constants/constants.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final Icon icon;
  final bool obsecureText;

  const AppTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obsecureText = false,
    this.textEditingController,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
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
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 18),
      obscureText: widget.obsecureText,
      cursorColor: Colors.black,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: hintTextColor),
        prefixIcon: Icon(
          widget.icon.icon,
          color: _isFocused ? buttonColor : greyColor,
        ),
        hintText: widget.hintText,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: buttonColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(color: greyColor),
        ),
      ),
    );
  }
}
