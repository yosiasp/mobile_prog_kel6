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
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Icon(Icons.account_circle,
                      size: 100, color: Colors.grey[300]),

                  const SizedBox(height: 50),
                  // welcome back message
                  const Text('Selamat Datang!',
                      style: TextStyle(
                        color: Colors.black,
                      )),

                  const SizedBox(height: 25),
                  // email field
                  MyTextField(
                      controller: emailController,
                      hintText: 'Username',
                      obscureText: false),

                  const SizedBox(height: 10),
                  // password field
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  const SizedBox(height: 10),
                  // sign in button
                  MyButton(onTap: () {}, text: 'Masuk'),

                  const SizedBox(height: 25),
                  // register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun?',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      const SizedBox(width: 4),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Daftar Sekarang!',
                            style: TextStyle(
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
        ));
  }
}
