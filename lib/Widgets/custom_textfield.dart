import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key,required this.hintText, this.maxline=1});
  final String hintText;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxline,
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: KPrimaryColor),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(KPrimaryColor),
      ),
    );
  }
}

OutlineInputBorder BuildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
