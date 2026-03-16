import 'package:chatty/services/chat/chat_service.dart';
import 'package:chatty/components/my_message_text_field.dart';
import 'package:chatty/components/my_textfield.dart';
import 'package:chatty/components/left_chat_bubble.dart';
import 'package:chatty/components/right_chat_bubble.dart';
import 'package:chatty/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _messageController=TextEditingController();
  final ChatService _chatService=ChatService();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  //send message function
  void sendMessage() async{
    //only send message if there is something to send
    if(_messageController.text.trim().isNotEmpty){
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text.trim());
      //clear the controller after sending a message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text("${widget.receiverUserEmail}",style: TextStyle(fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          //messages
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buildMessageInput(),
        ],
      ),
    );
  }
  //build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder:(context,snapshot){
          if(snapshot.hasError){
            return Text("eror : ${snapshot.error.toString()}");
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.black,
                  )
                ],
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document)=>_buildMessageItem(document))
                .toList(),
          );
        }
    );
  }
  //build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String,dynamic> data=document.data() as Map<String,dynamic>;
    //align the message to the right if the sender is the current user, otherwise to the left
    var alignment=(data["senderId"]==_firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Column(
          children: [
            //Text(data["senderEmail"]),
            Padding(
              padding: const EdgeInsets.all(8.0),
                //right chat bubble the message if the sender is the current user, otherwise to the left chat bubble
                child:(data["senderId"]==_firebaseAuth.currentUser!.uid)
                  ? RightChatBubble(message: data["message"])
                  :LeftChatBubble(message: data["message"])
            ),
          ],
        ),
      ),
    );
  }
  //build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: MyMessageTextField(
                controller: _messageController,
                obscureText: false,
                hintText: "Type something"
            ),
          ),
          //send button
          IconButton(
              onPressed: (){
                sendMessage();
              },
              icon: const Icon(Icons.arrow_upward,size: 30,color: Colors.black,fontWeight: FontWeight.bold,),
          ),
        ],
      ),
    );
  }
}
