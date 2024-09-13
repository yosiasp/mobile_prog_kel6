import 'dart:ui'; // Required for using BackdropFilter
import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';

class MyRegisterPage extends StatefulWidget {
  final Function()? onTap;
  const MyRegisterPage({super.key, required this.onTap});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( 
            child: Stack(
              children: [
                // Background Image For Header
                Container(
                  width: double.infinity,
                  height: 300, 
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/register-bg.JPG'), 
                      fit: BoxFit.cover,
                    ),
                  ),

                ),

                // Header With Background Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50), 

                      // Account Icon
                      Image.asset(
                        'assets/icon.png',  
                        width: 100,            
                        height: 100,
                      ),

                      const SizedBox(height: 25),

                      // App Title
                      const Text(
                        'YouGallery',
                        style: TextStyle(
                          fontFamily: 'Suse',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // App Quote
                      const Text(
                        'Share your Gallery, Share YOU',
                        style: TextStyle(
                          fontFamily: 'Suse',
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 100),

                      // Register title
                      const Align(
                        alignment: Alignment.centerLeft, 
                        child: Text(
                          'Daftar Akun Baru',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Username Field
                      MyTextField(
                        controller: emailController,
                        hintText: 'Username',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // Email Field
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // Password Field
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Confirm Password Field
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Sign Up Button
                      MyButton(onTap: () {}, text: 'Daftar'),

                      const SizedBox(height: 25),

                      // Login Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah Punya Akun?',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Masuk Sekarang',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
