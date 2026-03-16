import 'package:chatty/pages/chat_page.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instance of auth
  final FirebaseAuth _auth=FirebaseAuth.instance;

  //sign user out
  void signOut() async {
    // get the auth service
    final authService=Provider.of<AuthService>(context,listen: false);
    //sign out
    await authService.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text("Chats",style: GoogleFonts.aBeeZee(
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          //sign out button
          IconButton(
              onPressed: (){
                signOut();
              },
              icon: Icon(Icons.exit_to_app,color: Colors.black,size: 26,),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }
  //build a list of users except for the logged in user
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text("error");
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                ],
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc)=>_buildUserListItem(doc))
                .toList(),
          );
        }
    );
  }
  //build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String,dynamic> data=document.data()! as Map<String,dynamic>;

    //display all users except current user
    if(_auth.currentUser!.email !=data["email"]){
      return Column(
        children: [
          ListTile(
            title: Text(data["email"]),
            leading: Image.asset("lib/images/user.png",height: 30,),
            //pass the clicked user's chat page
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
                  receiverUserEmail: data["email"],
                  receiverUserId: data["uid"],
              )));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(),
          ),
        ],
      );
    }else {
      //return circular progress indicator
      return Container();
    }
  }
}
