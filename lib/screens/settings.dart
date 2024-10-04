// setting.dart
import 'package:flutter/material.dart';
import 'package:uts_mobile_prog/screens/account_center.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'about_account.dart';
import 'account_status.dart';
//import '../auth/auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Account Center'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountCenter()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Archive'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Arsip
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Account Privacy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Privasi Akun
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Account Status'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountStatus()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Account'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAccount()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              logout();
            },
          ),
        ],
      ),
    );
  }
}
