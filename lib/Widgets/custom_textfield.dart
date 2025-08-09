import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        hintText: "title",
        hintStyle: TextStyle(color: KPrimaryColor),
        enabledBorder:BuildBorder(),
        focusedBorder: BuildBorder(KPrimaryColor),
      ),
    );
  }
}
OutlineInputBorder BuildBorder([color]){
  return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: color ??Colors.white),
        );
}
