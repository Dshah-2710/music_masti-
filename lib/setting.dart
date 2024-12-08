// Author - Ansh Mistry

// This Setting page is about to handle the Music app [Music Masti]. 
// This Page gives multiple options for user to select. User can handle the Account info by going to Accountpage through Account option.
// Moreover, there is one Notification Option to give them notification about the new released songs, they can adjust this feature by there choice. 
// There is also one About Option which gives a dialoge box gives app name and owners of this app. 


import 'package:flutter/material.dart';
import 'account.dart';

void main() {
  runApp(const Settings());
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Variable to manage the toggle state
  bool _isNotificationsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(156, 0, 255, 38),
      ),
      body: ListView(
        children: [
          // Account page list option
          ListTile(
            title: const Text('Account'),
            subtitle: const Text('Manage your account settings'),
            leading: const Icon(Icons.person),
            onTap: () {
              // Navigate to the Account Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
          // Notifications option
          ListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Manage notification preferences'),
            leading: const Icon(Icons.notifications),
            trailing: Switch(
              value: _isNotificationsOn,
              onChanged: (value) {
                setState(() {
                  _isNotificationsOn = value; // Update toggle state
                });
              },
            ),
          ),
          // About
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Learn more about this app'),
            leading: const Icon(Icons.info),
            onTap: () {
              // Show about page
              showAboutDialog(
                context: context,
                applicationName: 'Music Masti',
                applicationIcon: const Icon(Icons.music_note),
                children: [
                  const Text('Enjoy the beats!'),
                  const Text('Owned by - Darshit | Keval | Shivam | Ansh'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

