import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:market/screen/signinscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyBO8uUNb5SstpKiS5vs3fGAlb6smzKRkc4",
        authDomain: "marketapp-73f6a.firebaseapp.com",
        projectId: "marketapp-73f6a",
        storageBucket: "marketapp-73f6a.appspot.com",
        messagingSenderId: "372535570884",
        appId: "1:372535570884:web:90423c384b903bcc7ff491",
        measurementId: "G-42LX7EL41Y"),
  );
  runApp(const mainApp());
}

class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  State<mainApp> createState() => _MainViewState();
}

class _MainViewState extends State<mainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignInScreen());
  }
}
