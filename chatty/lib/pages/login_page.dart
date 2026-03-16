import 'package:chatty/components/my_button.dart';
import 'package:chatty/components/my_textfield.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:chatty/components/my_button.dart';
import 'package:chatty/components/my_textfield.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //tf controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //for loading animation
  bool isLoading=false;


  //sign in user
  void signIn() async {
    // get the auth service
    final authService=Provider.of<AuthService>(context,listen:false);
    //isloading=true
    setState(() {
      isLoading=true;
    });
    //try login
    try {
      await authService.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${e.toString()}")),
      );
    }finally{
      if(mounted){
        //isloading=true
        setState(() {
          isLoading=false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //media query
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Image.asset("lib/images/chick.png", width: screenWidth * 0.20),
              SizedBox(height: screenHeight * 0.07),
              //welcome back text
              SizedBox(
                width: screenWidth * 0.8,
                child: Text(
                  "You've been missed, welcome back!",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              //email textfield
              MyTextfield(
                  controller: emailController,
                  obscureText: false,
                  labelText: "Email"),
              SizedBox(height: screenHeight * 0.02),
              //password textfield
              MyTextfield(
                  controller: passwordController,
                  obscureText: true,
                  labelText: "Password"),
              SizedBox(height: screenHeight * 0.05),
              //sign in button
              MyButton(
                  isLoading: isLoading,
                  onTap: signIn,
                  text: "Sign In"
              ),
              SizedBox(height: screenHeight * 0.02),
              // not a member, register now text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member?"),
                  SizedBox(width: screenWidth*0.01,),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onPressed: widget.onTap,
                    child: const Text(
                      "Register now",
                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}