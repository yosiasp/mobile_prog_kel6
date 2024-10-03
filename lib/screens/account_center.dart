import 'package:flutter/material.dart';
import 'update_password.dart';
import 'delete_account.dart';

class AccountCenter extends StatelessWidget {
  const AccountCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Center',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock_outline, color: Colors.black),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpdatePassword()),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title:
                const Text('Delete Account', style: TextStyle(color: Colors.red)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeleteAccount()),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
