import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  //button variables
  final String text;
  final void Function()? onTap;
  final bool isLoading;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    //var screen sizes (media query)
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth*0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: Colors.yellow,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: isLoading? Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Colors.white,
              ),
            ):Text("${text}"),
          ),
      ),
    );
  }
}
