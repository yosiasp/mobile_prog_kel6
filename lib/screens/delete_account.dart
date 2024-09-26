import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go Back To The Recent Screen
          },
        ),
        title: const Text(
          'Batal',
          style: TextStyle(
              fontSize: 22, fontFamily: 'Roboto', color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  Image.asset(
                    'assets/icon.png',
                    width: 100,
                    height: 100,
                  ),

                  const SizedBox(height: 50),

                  // App Title
                  const Text(
                    'Hapus Akun',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Description Text (Flexible Pharagraph)
                  const Text(
                    'Semua konten anda akan dihapus!',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),

                  const SizedBox(height: 12),

                  // Password Field
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Kata Sandi',
                    obscureText: true,
                  ),

                  const SizedBox(height: 15),

                  // Delete Account Button
                  MyButton(
                      onTap: () {
                        // Masukkin fungsinya disini
                        // Sebelom ngehapus akun, bikin muncul AlertDialog dulu, minta konfirmasi, "apakah anda ingin menghapus...." ya/tidak" 
                      },
                      text: 'Hapus Akun'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
