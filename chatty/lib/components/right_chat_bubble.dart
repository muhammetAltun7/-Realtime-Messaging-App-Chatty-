import 'package:flutter/material.dart';


class RightChatBubble extends StatelessWidget {
  final String message;
  const RightChatBubble({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
            topRight:Radius.circular(20),
            topLeft:Radius.circular(20),
            bottomRight:Radius.circular(0),
            bottomLeft:Radius.circular(20)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(message,style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
