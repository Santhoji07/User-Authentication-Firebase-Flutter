import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/home_screen.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDMf4kyQ3_X9PF5FqLpvBrnNUfHoRRnC2o",
  authDomain: "fir-733ff.firebaseapp.com",
  projectId: "fir-733ff",
  storageBucket: "fir-733ff.firebasestorage.app",
  messagingSenderId: "988477366143",
  appId: "1:988477366143:web:370264a9c0ab11f091044a"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}