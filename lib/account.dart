import 'package:flutter/material.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: const Color.fromARGB(156, 0, 255, 38),
      ),
      body: const Center(
        child: Text(
          'Manage your account here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
