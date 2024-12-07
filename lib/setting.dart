import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Settings());
} 

class Settings extends StatelessWidget {
  static bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: const Color.fromARGB(156, 0, 255, 38),
      ),

      body: ListView(
        children: [
          
          // Account
          ListTile(
            title: Text('Account'),
            subtitle: Text('Manage your account settings'),
            leading: Icon(Icons.person),
            onTap: () {
              // Navigate to account settings
            },
          ),
          // Notifications
          ListTile(
            title: Text('Notifications'),
            subtitle: Text('Manage notification preferences'),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          // Privacy Policy
          ListTile(
            title: Text('Privacy Policy'),
            leading: Icon(Icons.privacy_tip),
            onTap: () {
              // Show privacy policy
            },
          ),
          // Content and Display
          ListTile(
            title: Text('Content and Display'),
            subtitle: Text('Adjust content preferences and UI settings'),
            leading: Icon(Icons.display_settings),
            onTap: () {
              // Navigate to content and display settings
            },
          ),
          // Audio Quality
          ListTile(
            title: Text('Audio Quality'),
            subtitle: Text('Adjust audio streaming quality'),
            leading: Icon(Icons.audiotrack),
            onTap: () {
              // Navigate to audio quality settings
            },
          ),
          // Video Quality
          ListTile(
            title: Text('Video Quality'),
            subtitle: Text('Adjust video playback quality'),
            leading: Icon(Icons.video_settings),
            onTap: () {
              // Navigate to video quality settings
            },
          ),
          // Storage
          ListTile(
            title: Text('Storage'),
            subtitle: Text('Manage storage and downloads'),
            leading: Icon(Icons.storage),
            onTap: () {
              // Navigate to storage settings
            },
          ),
          // Apps and Devices
          ListTile(
            title: Text('Apps and Devices'),
            subtitle: Text('Manage connected apps and devices'),
            leading: Icon(Icons.devices),
            onTap: () {
              // Navigate to apps and devices settings
            },
          ),
          // Advertisement
          ListTile(
            title: Text('Advertisement'),
            subtitle: Text('Manage advertisement preferences'),
            leading: Icon(Icons.ad_units),
            onTap: () {
              // Navigate to advertisement settings
            },
          ),
          // About
          ListTile(
            title: Text('About'),
            subtitle: Text('Learn more about this app'),
            leading: Icon(Icons.info),
            onTap: () {
              // Show about page
            },
          ),
        ],
      ),
    );
  }
}

