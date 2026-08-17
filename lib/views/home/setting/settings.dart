// ================= SETTINGS =================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final box = GetStorage();

  late bool dark;

  @override
  void initState() {
    super.initState();

    dark = box.read('darkMode') ?? false;
  }

  void changeTheme(bool value) {

    setState(() {
      dark = value;
    });

    box.write('darkMode', value);

    Get.changeTheme(
      value
          ? ThemeData.dark()
          : ThemeData.light(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,
      ),

      body: ListTile(
        leading: Icon(
          dark
              ? Icons.dark_mode
              : Icons.light_mode,
        ),

        title: const Text(
          'Dark Mode',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          dark
              ? 'Dark theme enabled'
              : 'Light theme enabled',
        ),

        trailing: Switch(
          value: dark,
          onChanged: changeTheme,
        ),
      ),
    );
  }
}