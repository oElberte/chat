import 'package:chat/screens/auth_or_app_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My chat app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthOrAppScreen(),
    );
  }
}
