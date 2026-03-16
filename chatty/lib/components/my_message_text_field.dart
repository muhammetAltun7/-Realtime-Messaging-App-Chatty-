import 'package:flutter/material.dart';

class MyMessageTextField extends StatelessWidget {

  //textfield variables
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyMessageTextField({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.hintText,
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
          hintStyle: TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
