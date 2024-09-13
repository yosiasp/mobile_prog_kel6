import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';

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
                    'YouGallery',
                    style: TextStyle(
                      fontFamily: 'Suse',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Email Field

                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // Password Field

                  MyTextField(
                    controller: newPasswordController,
                    hintText: 'New Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // Confirm Password Field

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm New Password',
                    obscureText: true,
                  ), // Tambahkan field konfirmasi password

                  const SizedBox(height: 10),

                  // Sign In Button
                  MyButton(onTap: () {}, text: 'Update Password'),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
