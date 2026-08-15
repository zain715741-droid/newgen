import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF7F9F9),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              24,
              55,
              24,
              25,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF075E54),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_rounded,
                    size: 45,
                    color: Color(0xFF075E54),
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Ali Zain',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'ali@example.com',
                  style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(.75),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          _drawerItem(
            icon: Icons.person_outline_rounded,
            title: 'Profile',
            onTap: () {},
          ),

          _drawerItem(
            icon: Icons.group_outlined,
            title: 'New Group',
            onTap: () {},
          ),

          _drawerItem(
            icon: Icons.archive_outlined,
            title: 'Archived',
            onTap: () {},
          ),

          _drawerItem(
            icon: Icons.star_outline_rounded,
            title: 'Starred Messages',
            onTap: () {},
          ),

          _drawerItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),

          const Spacer(),

          const Divider(),

          _drawerItem(
            icon: Icons.logout_rounded,
            title: 'Logout',
            onTap: () {},
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      leading: Icon(
        icon,
        color: const Color(0xFF075E54),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onTap: onTap,
    );
  }
}