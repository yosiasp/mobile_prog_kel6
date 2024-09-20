import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'forget_password.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
          style:
              TextStyle(fontSize: 22, fontFamily: 'Roboto', color: Colors.black),
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
                    'Ganti Kata Sandi',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Email Field

                  MyTextField(
                    controller: passwordController,
                    hintText: 'Kata Sandi Lama',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // Password Field
                  MyTextField(
                    controller: newPasswordController,
                    hintText: 'Kata Sandi Baru',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // Confirm Password Field

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Konfirmasi Kata Sandi Baru',
                    obscureText: true,
                  ), // Tambahkan field konfirmasi password

                  const SizedBox(height: 15),

                  // Change Password Button
                  MyButton(onTap: () {}, text: 'Ubah Kata Sandi'),

                  const SizedBox(height: 10),

                  // Forgot Password Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgetPassword()),
                          );
                        },
                        child: const Text(
                          'Lupa Kata Sandi',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xFF4285F4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
