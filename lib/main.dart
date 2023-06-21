import 'package:firebase/page/add_name_page.dart';
import 'package:firebase/page/edit_name_page.dart';
import 'package:firebase/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//importaciones 
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/add': (context) => const addNamePage (),
        '/edit':(context) => const EditNamePage()
      },
    );
  }
}

