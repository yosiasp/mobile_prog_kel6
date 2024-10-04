import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> sendEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.toString());
      displayMessage('Email Sent', 'Email with the link has been sent');
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      displayMessage('Error', 'An error occured. Please try again');
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Description Text (Flexible Pharagraph)
                  Text(
                    'Enter your email address. We will send you an email to reset your password.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.grey[400],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),

                  const SizedBox(height: 12),

                  // Email Field
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Send Email Button
                  MyButton(onTap: sendEmail, text: 'Send Email'),

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
