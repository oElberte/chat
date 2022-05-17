import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/screens/auth_or_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'My chat app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthOrAppScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
