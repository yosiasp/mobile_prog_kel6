// setting.dart
import 'package:flutter/material.dart';
import 'package:uts_mobile_prog/screens/akun.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Pusat Akun'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountCenterPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Arsip'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Arsip
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Notifikasi
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privasi Akun'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Privasi Akun
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Status Akun'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Status Akun
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi untuk Tentang
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Tambahkan Akun'),
            onTap: () {
              // Aksi untuk Tambahkan Akun
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () {
              // Aksi untuk Keluar dari akun ini
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar dari Semua Akun'),
            onTap: () {
              // Aksi untuk Keluar dari semua akun
            },
          ),
        ],
     ),
);
}
}