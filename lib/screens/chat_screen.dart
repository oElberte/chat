import 'dart:math';

import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/models/chat_notification.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int notificationsCount =
        Provider.of<ChatNotificationService>(context).itemsCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Berte Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text('Exit')
                    ],
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, right: 3),
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return NotificationScreen();
                      }),
                    );
                  },
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: Colors.red.shade800,
                    child: notificationsCount > 9
                        ? const Text(
                            '9+',
                            style: TextStyle(fontSize: 12),
                          )
                        : Text(
                            notificationsCount.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
      // I used this button to test if the notifications were working
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(
      //       context,
      //       listen: false,
      //     ).add(
      //       ChatNotification(
      //         title: 'One more notification!',
      //         body: Random().nextDouble().toString(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
