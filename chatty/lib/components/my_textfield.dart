import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {

  //textfield variables
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    //var screen sizes (media query)
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth*0.8,
      height: screenHeight*0.06,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black,
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
