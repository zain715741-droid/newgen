import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'chats_screen.dart';
import 'status_screen.dart';
import 'calls_screen.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    final screens = [
      const ChatsScreen(),
      const StatusScreen(),
      const CallsScreen(),
    ];

    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFFF7F9F9),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF075E54),
          foregroundColor: Colors.white,
          titleSpacing: 20,
          title: const Text(
            'Chat App',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: (value) {},
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'new_group',
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('Settings'),
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),

        drawer: const AppDrawer(),

        body: screens[controller.currentIndex.value],

        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          foregroundColor: Colors.white,
          elevation: 5,
          onPressed: () {},
          child: Icon(
            controller.currentIndex.value == 0
                ? Icons.chat_rounded
                : controller.currentIndex.value == 1
                    ? Icons.camera_alt_rounded
                    : Icons.add_call,
          ),
        ),

        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black12,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePage,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF075E54),
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                activeIcon: Icon(Icons.chat_bubble_rounded),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.donut_large_outlined),
                activeIcon: Icon(Icons.donut_large_rounded),
                label: 'Status',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call_outlined),
                activeIcon: Icon(Icons.call_rounded),
                label: 'Calls',
              ),
            ],
          ),
        ),
      ),
    );
  }
}