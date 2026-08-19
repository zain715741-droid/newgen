// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newgen/controllers/home_controller.dart';
import 'package:newgen/views/home/chat/chats_screen.dart';
import 'package:newgen/views/setting/settings.dart';
import 'package:newgen/views/home/status_screen.dart';
import 'package:newgen/views/home/calls_screen.dart';
import 'package:newgen/views/profile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final pages = const [
    ChatsPage(),
    StatusPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeCtrl ctrl = Get.put(HomeCtrl());
    // ignore: unused_local_variable
    final box = GetStorage();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,

        title: Obx(
          () => Text( ctrl.index.value == 0 ? 'NewGen': ctrl.index.value == 1 ? 'Status': 'Calls',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                'Search',
                'Search clicked',
              );
            },
            icon: const Icon(Icons.search),
          ),

          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],

            onSelected: (value) {
              if (value == 'settings') {
                Get.to(() => const SettingsPage());
              }

              if (value == 'logout') {
                ctrl.logout();
              }
            },
          ),
        ],
      ),

      // DRAWER
      drawer: Drawer(
        child: Column(
          children: [

            // HEADER
            Container(
              height: 210,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff667EEA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,size: 45,color: Color(0xff667EEA),),
                  ),

                  const SizedBox(height: 10),

                Obx(
                     () => Text( ctrl.userName.value,
                           style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),
                           ),
                    ),

                  Text('Welcome back!',style: TextStyle(color: Colors.white.withOpacity(.8),),),

                ],
              ),
            ),

            const SizedBox(height: 10),
           
            // PROFILE
            ListTile(
              leading:const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () {
                Get.back();
                Get.to(() => const ProfilePage());
              },
            ),
            
            // CHATS
            ListTile(
              leading: const Icon(Icons.chat_bubble_outline),
              title: const Text('Chats'),
              onTap: () {
                ctrl.changePage(0);
                Get.back();
              },
            ),

            // STATUS
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Status'),
              onTap: () {
                ctrl.changePage(1);
                Get.back();
              },
            ),

            // CALLS
            ListTile(
              leading: const Icon(Icons.call_outlined),
              title: const Text('Calls'),
              onTap: () {
                ctrl.changePage(2);
                Get.back();
              },
            ),


            // SETTINGS
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                Get.back();
                Get.to(() => const SettingsPage());
              },
            ),

           const Spacer(),

           const Divider(),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                  left: 8,
                  right: 8,
                ),
                child: ListTile(
                  tileColor: Colors.red.withOpacity(.08),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),

                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  onTap: ctrl.logout,
                ),
              ),
            const SizedBox(height: 15),
          ],
        ),
      ),

      // BODY
      body: Obx(
        () => pages[ctrl.index.value],
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: ctrl.index.value,
          onTap: ctrl.changePage,

          selectedItemColor: const Color(0xff667EEA),
          unselectedItemColor: Colors.grey,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined),
              activeIcon: Icon(Icons.circle),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call_outlined),
              activeIcon: Icon(Icons.call),
              label: 'Calls',
            ),
          ],
        ),
      ),
    );
  }
}
