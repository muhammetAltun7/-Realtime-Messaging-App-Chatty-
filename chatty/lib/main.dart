import 'package:chatty/firebase_options.dart';
import 'package:chatty/pages/splash_screen_page.dart';
import 'package:chatty/services/auth/auth_gate.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:chatty/firebase_options.dart';

import 'package:chatty/services/auth/auth_gate.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
     ChangeNotifierProvider(
         create: (context)=>AuthService(),
       child: MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  bool isLogin=true;

  //toggle pages between login and register
  void togglePages() {
  }
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenPage(),
    );
  }
}
