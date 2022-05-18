import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_dummy_service.dart';
import 'package:chat/core/services/chat/chat_firebase_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  // Here you can change if the chat service is going to run in the memory or in the firebase
  factory ChatService() {
    // return ChatDummyService();
    return ChatFirebaseService();
  }
}
