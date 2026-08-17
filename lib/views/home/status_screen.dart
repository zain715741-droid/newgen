import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        ListTile(
          leading: CircleAvatar(
            radius: 28,
            child: Icon(Icons.person),
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Recent Updates',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 28,
            child: Icon(Icons.person),
          ),
          title: Text('Ali'),
          subtitle: Text('Today, 10:20 AM'),
        ),
      ],
    );
  }
}