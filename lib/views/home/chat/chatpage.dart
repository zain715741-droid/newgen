import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newgen/controllers/chat_ctrl.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String uid;

  ChatPage({
    super.key,
    required this.name,
    required this.uid,
  });

  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(
      ChatCtrl(uid),
      tag: uid,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,

        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xff667EEA),
              ),
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'online',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        children: [

          // MESSAGES
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: ctrl.messages
                  .orderBy('time', descending: false)
                  .snapshots(),

              builder: (context, snapshot) {

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: docs.length,

                  itemBuilder: (context, index) {

                    final data =
                        docs[index].data()
                            as Map<String, dynamic>;

                    final isMe =
                        data['senderId'] == ctrl.myUid;

                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,

                      child: Container(
                        margin:
                            const EdgeInsets.only(bottom: 8),

                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),

                        constraints:
                            const BoxConstraints(
                          maxWidth: 280,
                        ),

                        decoration: BoxDecoration(
                          color: isMe
                              ? const Color(0xff667EEA)
                              : Colors.white,

                          borderRadius:
                              BorderRadius.circular(16),
                        ),

                        child: Text(
                          data['text'] ?? '',
                          style: TextStyle(
                            color: isMe
                                ? Colors.white
                                : Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // MESSAGE BOX
          SafeArea(
            top: false,

            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,

              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: msgCtrl,

                      decoration: InputDecoration(
                        hintText: 'Type a message...',

                        prefixIcon: const Icon(
                          Icons.emoji_emotions_outlined,
                        ),

                        filled: true,
                        fillColor:
                            const Color(0xffF1F2F6),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 7),

                  CircleAvatar(
                    radius: 24,
                    backgroundColor:
                        const Color(0xff667EEA),

                    child: IconButton(
                      onPressed: () {
                        ctrl.sendMessage(msgCtrl.text);
                        msgCtrl.clear();
                      },

                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}