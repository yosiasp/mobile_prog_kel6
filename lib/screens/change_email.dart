import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final oldEmailController = TextEditingController();
  final newEmailController = TextEditingController();

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
                    'Ubah Alamat Email',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Old Email Field
                  MyTextField(
                    controller: oldEmailController,
                    hintText: 'Email Lama',
                    obscureText: true,
                  ),

                  const SizedBox(height: 15),

                  // New Email Field
                  MyTextField(
                    controller: oldEmailController,
                    hintText: 'Email Baru',
                    obscureText: true,
                  ),

                  const SizedBox(height: 15),

                  // Change Email Button
                  MyButton(
                      onTap: () {
                        
                      },
                      text: 'Ganti Email'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
