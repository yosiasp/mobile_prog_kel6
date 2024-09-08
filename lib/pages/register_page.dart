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
                  const Text('Mari Daftar!',
                      style: TextStyle(
                        color: Colors.black,
                      )),

                  const SizedBox(height: 25),
                  // username field
                  MyTextField(
                      controller: emailController,
                      hintText: 'Username',
                      obscureText: false),

                  const SizedBox(height: 10),
                  // email field
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(height: 10),
                  // password field
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  const SizedBox(height: 10),
                  // confirm password field
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: ' Confirm Password',
                      obscureText: true),

                  const SizedBox(height: 10),
                  // sign in button
                  MyButton(onTap: () {}, text: 'Daftar'),

                  const SizedBox(height: 25),
                  // register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sudah Punya Akun?',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      const SizedBox(width: 4),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Masuk Sekarang!',
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
