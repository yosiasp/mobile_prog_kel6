// setting.dart
import 'package:flutter/material.dart';
import 'package:uts_mobile_prog/screens/account_center.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'about_account.dart';
import 'account_status.dart';
import 'saved_posts.dart';
//import '../auth/auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void logout(BuildContext context) {
    // Dialog message for log out confirmation
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              fontSize: 21, 
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold
              ),
          ),
          actions: [
            // No option (closing the dialog)
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            // Yes option (Logging out)
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF219ebc),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context); 
              },
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ],
        );
      },
    );
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
            leading: const Icon(Icons.bookmark),
            title: const Text('Saved'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SavedPosts()),
              );
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
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Log out', style:TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}
