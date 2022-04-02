import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/login.dart';
import 'package:flutter_firebase/pages/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDdmCfHBEDzjb2Sw8aO_wv3Cse1P94ubjQ", // Your apiKey
      appId: "1:124146911997:android:6b1095ad4e869a27820c94", // Your appId
      projectId: "flutter1-22e47",
      messagingSenderId: '124146911997', // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ,
      home: const SignUpPage(),
      // home: const LoginPage(),
    );
  }
}
