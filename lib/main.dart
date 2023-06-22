import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quicko_web_admin/views/screens/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb || Platform.isAndroid?
    FirebaseOptions(
        apiKey: "AIzaSyCSK67nz3DoXOROf-XLXY8KRKLJMjPCrAU",
        appId: "1:836935690091:web:7f24e84887fcd57cad4e2e",
        messagingSenderId: "836935690091",
        projectId: "quicko-a6c6e",
        storageBucket: "quicko-a6c6e.appspot.com")
        : null
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}

