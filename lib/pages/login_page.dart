import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  // App Logo
                  Image.asset(
                    'assets/icon.png',
                    width: 100,
                    height: 100,
                  ),

                  const SizedBox(height: 50),

                  // App Title
                  const Text('YouGallery',
                      style: TextStyle(
                        fontFamily: 'Suse',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),

                  const SizedBox(height: 25),

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

                  const SizedBox(height: 10),

                  // Sign In Button
                  MyButton(onTap: () {}, text: 'Masuk'),

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
                            'Daftar Sekarang!',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF4285F4),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
