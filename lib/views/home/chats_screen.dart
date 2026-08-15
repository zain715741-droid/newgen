import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      ['Ahmed', 'Hey! How are you?', '10:30 AM', '2'],
      ['Usman', 'Okay bro 👍', '09:45 AM', '1'],
      ['Hamza', 'See you tomorrow', 'Yesterday', '0'],
      ['Ali', 'Thanks!', 'Yesterday', '3'],
      [
        'Software Engineering',
        'Bilal: Assignment uploaded',
        'Yesterday',
        '5',
      ],
      ['Hassan', 'Call me when you are free', 'Monday', '0'],
      ['Umer', 'Good morning', 'Monday', '1'],
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 90,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

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

            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFFE0F2EF),
                  child: Text(
                    user[0][0].toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF075E54),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                if (index < 3)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF25D366),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            title: Text(
              user[0],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                user[1],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  user[2],
                  style: TextStyle(
                    fontSize: 11,
                    color: user[3] != '0'
                        ? const Color(0xFF25D366)
                        : Colors.grey,
                    fontWeight: user[3] != '0'
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),

                const SizedBox(height: 7),

                if (user[3] != '0')
                  Container(
                    height: 21,
                    width: 21,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF25D366),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      user[3],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),

            onTap: () {},
          ),
        );
      },
    );
  }
}