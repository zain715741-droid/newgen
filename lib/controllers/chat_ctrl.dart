import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatCtrl extends GetxController {
  final String otherUid;

  ChatCtrl(this.otherUid);

  String get myUid => FirebaseAuth.instance.currentUser!.uid;

  String get chatId {
    final ids = [myUid, otherUid]..sort();
    return '${ids[0]}_${ids[1]}';
  }

  CollectionReference get messages => FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages');

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add({
      'text': text.trim(),
      'senderId': myUid,
      'receiverId': otherUid,
      'time': FieldValue.serverTimestamp(),
    });
  }
}