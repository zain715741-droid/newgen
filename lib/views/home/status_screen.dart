import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(
            'My Status',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Tap to add status update',
          ),
        ),

        const Divider(),

        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Recent updates',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: const Text('Ali'),
          subtitle: const Text(
            'Today, 10:20 AM',
          ),
        ),
      ],
    );
  }
}