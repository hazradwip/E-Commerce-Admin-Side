
import 'package:admin_panel/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBOEQtRW3qlCFmBLqX69Mwc_Am1tkcYb2M",
      appId: "1:952202347121:android:dc1d01a6b2a86c6c0591d0",
      projectId: "952202347121",
      messagingSenderId: "952202347121"
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
