// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/text_field.dart';
import '../components/button.dart';
// import 'profile.dart';
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

  // ignore: non_constant_identifier_names
  void Masuk() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print, use_build_context_synchronously
      Navigator.pop(context);
      String title;
      String message;

      switch (e.code) {
        case 'invalid-email':
          title = 'Invalid Email';
          message = 'The email is not valid';
          break;
        case 'user-not-found':
          title = 'User Not Found';
          message = 'User does not exists';
          break;
        case 'wrong-password':
          title = 'Wrong Password';
          message = 'The password is invallid';
          break;
        case 'user-disabled':
          title = 'Disabled Account';
          message = 'Account has been disabled, please contact us';
          break;
        default:
          title = 'Error';
          message = 'An error occured. Please try again';
      }

      displayMessage(title, message);
    }
  }

  void displayMessage(String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22, 
              fontFamily: 'Roboto', 
              fontWeight: FontWeight.bold
              ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontFamily: 'Roboto', 
              fontSize: 18),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF219ebc)),
              ),
            ),
          ],
        );
      },
    );
  }

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
                      Text('Welcome!',
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
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(height: 10),

                  // Password Field
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  const SizedBox(height: 15),

                  // Sign In Button
                  MyButton(onTap: Masuk, text: 'Login'),

                  const SizedBox(height: 25),

                  // Register Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New here?',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                          )),
                      const SizedBox(width: 4),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register now',
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
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()),
                          );
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
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
