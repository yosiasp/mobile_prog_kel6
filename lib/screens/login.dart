// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'profile.dart';
import 'forget_password.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      // App Logo
                      Image.asset(
                        'assets/icon.png',
                        width: 110,
                        height: 110,
                      ),

                      const SizedBox(width: 20), 

                      // App Title
                      const Text(
                        'YouGallery',
                        style: TextStyle(
                          fontFamily: 'Suse',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Welcome Text
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Selamat Datang',
                          style: TextStyle(
                            fontFamily: 'Suse',
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                      )),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Email Field
                  MyTextField(
                      controller: emailController,
                      hintText: 'Username',
                      obscureText: false),

                  const SizedBox(height: 10),

                  // Password Field
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  const SizedBox(height: 15),

                  // Sign In Button
                  MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile()),
                      );
                    },
                    text: 'Masuk'),

                  const SizedBox(height: 25),

                  // Register Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun?',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                          )),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Daftar Sekarang',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xFF4285F4),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    ],
                  ),

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
        )));
  }
}
