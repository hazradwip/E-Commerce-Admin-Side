
import 'package:admin_panel/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "xxxxx",
      appId: "xxxxx",
      projectId: "xxxxx",
      messagingSenderId: "xxxxx"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogIn(key: key),
    );
  }
}
