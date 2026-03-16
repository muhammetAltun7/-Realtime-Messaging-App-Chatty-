import 'package:chatty/model/message.dart';
import 'package:chatty/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class ChatService extends ChangeNotifier {

  //get instance of auth and firestore
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  //send message
  Future<void> sendMessage(String receiverID,String message) async {

    //get current user infos
    final String currentUserId=_firebaseAuth.currentUser!.uid;
    final String currentUseremail=_firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp=Timestamp.now();

    //create a new message
    Message newMessage=Message(
        senderId: currentUserId,
        timestamp: timestamp,
        message: message,
        receiverId: receiverID,
        senderEmail: currentUseremail,
    );

    //construct a chat room id from current user id and receiver user id
    List<String> ids=[currentUserId,receiverID];
    ids.sort(); //sort the ids (this ensures the chat room id is always the same for any pair of people)
    String chatRoomId=ids.join("_"); //combine the ids into a single to use as a chatroom id

    //add a new message to firestore
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId).collection("messages")
        .add(newMessage.toMap());

  }

  //get message
  Stream<QuerySnapshot> getMessages(String userId,String otherUserId) {
    //construct chat room id from user ids
    List<String> ids=[userId,otherUserId];
    ids.sort();
    String chatRoomID=ids.join("_");
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID).collection("messages")
        .orderBy("timestamp",descending: false)
        .snapshots();
  }


}