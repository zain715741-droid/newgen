import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = [
      ['Ahmed', 'Today, 10:30 AM'],
      ['Usman', 'Today, 09:15 AM'],
      ['Hamza', 'Yesterday, 08:20 PM'],
      ['Ali', 'Yesterday, 06:40 PM'],
      ['Hassan', 'Monday, 04:20 PM'],
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 90,
      ),
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];

        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFFE0F2EF),
              child: Text(
                call[0][0],
                style: const TextStyle(
                  color: Color(0xFF075E54),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              call[0],
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(
                  index.isEven
                      ? Icons.call_received_rounded
                      : Icons.call_made_rounded,
                  size: 16,
                  color: index.isEven
                      ? Colors.red
                      : const Color(0xFF25D366),
                ),
                const SizedBox(width: 5),
                Text(
                  call[1],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            trailing: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2EF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.call_rounded,
                color: Color(0xFF075E54),
              ),
            ),
          ),
        );
      },
    );
  }
}