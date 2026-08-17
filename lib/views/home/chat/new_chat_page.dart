import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newgen/views/home/chat/chatpage.dart';

class NewChatPage extends StatelessWidget {
  const NewChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final myUid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Chat'),
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('student').snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = snapshot.data!.docs.where((user) => user.id != myUid).toList();

          if (users.isEmpty) {
            return const Center(
              child: Text('No other users found'),
            );
          }

          return ListView.builder(
            itemCount: users.length,

            itemBuilder: (context, index) {

              final data = users[index].data()as Map<String, dynamic>;
              final uid = users[index].id;
              final name = data['name'] ?? 'User';

              return ListTile(
                contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5,),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor:const Color(0xff667EEA),
                  child: Text( name[0].toUpperCase(),style: const TextStyle(color: Colors.white,fontSize: 20,), ),
                ),

                title: Text(name,style: const TextStyle(fontWeight: FontWeight.bold,),),
                subtitle: Text(data['email'] ?? '',),

                onTap: () {
                  Get.to(
                    () => ChatPage(
                      name: name,
                      uid: uid,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}