import 'package:clothingstore/splashScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
         splashFactory: NoSplash.splashFactory,
         highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
    );
  }
}