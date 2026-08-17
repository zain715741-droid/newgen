import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('student')
            .doc(uid)
            .snapshots(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (data == null) {
            return const Center(
              child: Text('Profile not found'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xff667EEA),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              Center(
                child: Text(
                  data['name'] ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              info('Email', data['email']),
              info('Phone', data['phone']),
              info('CNIC', data['cnic']),
              info('Blood Group', data['bloodGroup']),
            ],
          );
        },
      ),
    );
  }

  Widget info(String title, dynamic value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(
        leading: const Icon(
          Icons.person_outline,
          color: Color(0xff667EEA),
        ),

        title: Text(title),

        subtitle: Text(
          value?.toString() ?? '',
        ),
      ),
    );
  }
}