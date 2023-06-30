import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

Widget buildCustomTextField(
    String labelText, String hintText, TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
    child: Container(
      color: ColorConstants.textFieldBg,
      child: TextField(
        style: const TextStyle(color: Color.fromARGB(255, 183, 182, 182)),
        controller: controller,
        enableSuggestions: true,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          labelText: labelText,
          labelStyle: const TextStyle(color: ColorConstants.accentColor),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.accentColor,
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.accentColor,
            ),
          ),
        ),
      ),
    ),
  );
}
