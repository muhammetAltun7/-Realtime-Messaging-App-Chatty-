import 'package:cloud_firestore/cloud_firestore.dart';

//message class
class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({required this.senderId,required this.timestamp,required this.message,required this.receiverId,required this.senderEmail});

  //convert to a map
  Map<String,dynamic> toMap() {
    return {
      "senderId":senderId,
      "senderEmail":senderEmail,
      "receiverId":receiverId,
      "message":message,
      "timestamp":timestamp,
    };
  }
}