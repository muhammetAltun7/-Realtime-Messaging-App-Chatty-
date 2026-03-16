import 'package:chatty/components/my_button.dart';
import 'package:chatty/components/my_textfield.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:chatty/components/my_button.dart';
import 'package:chatty/components/my_textfield.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //controllers
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();

  //for loading animation
  bool isLoading=false;


  //create a user
  void signUp() async {
    //get the auth service
    final authService=Provider.of<AuthService>(context,listen: false);
    //isloading=true
    setState(() {
      isLoading=true;
    });
    //try register
    try {
      await authService.createUserWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
    }//catch any errors
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${e.toString()}")),
      );
    }finally{
      if(mounted){
        setState(() {
          isLoading=false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    //var screen sizes (media query)
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Image.asset("lib/images/chick.png",width: screenWidth*0.20,),
              //welcome text
              SizedBox(height: screenHeight*0.07,),
              Container(
                width: screenWidth*0.8,
                child: Text("You've been missed, welcome back!",style: GoogleFonts.aBeeZee(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: screenHeight*0.1,),
              //email textfield
              MyTextfield(
                  controller: emailController,
                  obscureText: false,
                  labelText: "Email"
              ),
              SizedBox(height: screenHeight*0.02,),
              //password textfield
              MyTextfield(
                  controller: passwordController,
                  obscureText: true,
                  labelText: "Password"
              ),
              SizedBox(height: screenHeight*0.02,),
              //confirm password textfield
              MyTextfield(
                  controller: confirmPasswordController,
                  obscureText: true,
                  labelText: "Confirm password"
              ),
              SizedBox(height: screenHeight*0.05,),
              //login button
              MyButton(
                isLoading: isLoading,
                onTap: (){
                  //if passwords are different
                  if(passwordController.text.trim()!=confirmPasswordController.text.trim()){
                    // show passwords do not match message
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Passwords do not match!"))
                    );
                  }else{ //if passwords are same
                    signUp();
                  }
                },
                text: "Sign Up",
              ),
              //already a member text
              SizedBox(height: screenHeight*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member?"),
                  SizedBox(width: screenWidth*0.01,),
                  TextButton(
                    onPressed: widget.onTap,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    child: const Text(
                      "Sign in now",
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
