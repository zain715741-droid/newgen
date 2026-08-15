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
        appBar: AppBar(
          title: const Text('Chat App'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),

        drawer: const AppDrawer(),

        body: screens[controller.currentIndex.value],

        bottomNavigationBar:
            BottomNavigationBar(
          currentIndex:
              controller.currentIndex.value,

          onTap: controller.changePage,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
          ],
        ),
      ),
    );
  }
}