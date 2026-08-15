import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(
            'User ${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'Today, 11:00 AM',
          ),
          trailing: const Icon(
            Icons.call,
          ),
        );
      },
    );
  }
}