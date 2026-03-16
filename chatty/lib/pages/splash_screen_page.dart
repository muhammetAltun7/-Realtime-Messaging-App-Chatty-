import 'package:chatty/components/my_button.dart';
import 'package:chatty/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  Widget build(BuildContext context) {

    //media query (device sizes)
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset("lib/images/chick.png",width: screenWidth*0.30,),
            SizedBox(height: screenHeight*0.1,),
            //text about app
            Container(
              width: screenWidth*0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Simple, secure, and fast messaging",textAlign: TextAlign.start,
                  style: GoogleFonts.notoSerif(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
            ),
            SizedBox(height: screenHeight*0.02,),
            //designed for everyone text
            Container(
              width: screenWidth*0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Designed for everyone",textAlign: TextAlign.start,
                  style: GoogleFonts.notoSerif(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),),
              ),
            ),
            SizedBox(height: screenHeight*0.1,),
            //get started button
            MyButton(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthGate()));
                },
                text: "Get Started",
                isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
