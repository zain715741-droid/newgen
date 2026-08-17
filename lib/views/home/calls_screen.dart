import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('Ali'),
          subtitle: Text('Today, 10:30 AM'),
          trailing: Icon(Icons.call),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('Ahmad'),
          subtitle: Text('Yesterday, 08:20 PM'),
          trailing: Icon(Icons.videocam),
        ),
      ],
    );
  }
}