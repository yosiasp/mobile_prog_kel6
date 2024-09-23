import 'package:flutter/material.dart';
import 'update_password.dart';

class AccountCenterPage extends StatelessWidget {
  const AccountCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pusat Akun',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock_outline, color: Colors.black),
            title: const Text('Ganti Kata Sandi'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Aksi ketika "Ganti Kata Sandi" dipilih
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpdatePassword()),
              );
            },
          ),
          const Divider(), // Garis pemisah

          ListTile(
            leading: const Icon(Icons.email_outlined, color: Colors.black),
            title: const Text('Ubah Alamat Email'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Aksi ketika "Ubah Alamat Email" dipilih
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangeEmailPage()),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title:
                const Text('Hapus Akun', style: TextStyle(color: Colors.red)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Aksi ketika "Hapus Akun" dipilih
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeleteAccountPage()),
              );
            },
          ),
          const Divider(),

          // Tambahkan item lain di sini sesuai kebutuhan
        ],
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ganti Kata Sandi')),
      body: const Center(child: Text('Halaman Ganti Kata Sandi')),
    );
  }
}

class ChangeEmailPage extends StatelessWidget {
  const ChangeEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubah Alamat Email')),
      body: const Center(child: Text('Halaman Ubah Alamat Email')),
    );
  }
}

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hapus Akun')),
      body: const Center(child: Text('Halaman Hapus Akun')),
);
}
}