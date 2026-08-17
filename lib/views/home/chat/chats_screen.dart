import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newgen/views/home/chat/chatpage.dart';
import 'package:newgen/views/home/chat/new_chat_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myUid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('student').snapshots(),

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = snapshot.data!.docs.where((e) => e.id != myUid).toList();

          if (users.isEmpty) {
            return const Center(
              child: Text('No users found'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final data = user.data()  as Map<String, dynamic>;

              final name = data['name'] ?? 'User';
              final uid = user.id;

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),

                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xff667EEA),

                    child: Text( name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  title: Text(name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,),),
                  subtitle: Text(data['email'] ?? '',),
                  trailing: const Icon(Icons.chat_bubble_outline,color: Color(0xff667EEA),),

                  onLongPress: (){
                    // print('Long pressed on chat with $name');
                    
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Chat'),
                          content: Text('Are you sure you want to delete the chat with $name?'),
                          actions: [
                            
                            TextButton(child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                           
                            TextButton(child: Text('Delete'),
                              onPressed: ()async {
                                Navigator.of(context).pop();

                                await FirebaseFirestore.instance .collection('student').doc(uid).delete();
                               
                                Get.snackbar('Deleted','$name removed successfully',);    
                                  
                              },
                            ),


                          ],
                        );
                      },
                    );
                      
                  },

                  onTap: () {
                    Get.to(
                      () => ChatPage(
                                        name: name,
                                        uid: uid,
                            ),
                           );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,

        onPressed: () {
          Get.to(() => const NewChatPage());
        },

        icon: const Icon(Icons.chat),
        label: const Text('New Chat'),
      ),
    );
  }
}