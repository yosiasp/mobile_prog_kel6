import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'forget_password.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void changePassword() async {
    if (newPasswordController.text == confirmPasswordController.text) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        // Authentication to check the old password
        AuthCredential credential = EmailAuthProvider.credential(
          email: user?.email ?? '', 
          password: oldPasswordController.text,
        );

        await user?.reauthenticateWithCredential(credential);

        // Updating password if the old password is corrct
        await user?.updatePassword(newPasswordController.text);

        String title;
        String message;

        title = 'Password Changed';
        message = 'Your password has changed successfully';

        displayMessage(title, message);

      } on FirebaseAuthException { // If old password is incorrect
      // ignore: avoid_print, use_build_context_synchronously
      Navigator.pop(context);
      String title;
      String message;

      title = 'Invalid Password';
      message = 'The old password you entered is incorrect';
      
      displayMessage(title, message);
    } catch (e) {
        String title;
        String message;

        title = 'Error';
        message = 'An error occured: $e';
        
        displayMessage(title, message);
      }
    } else {
        String title;
        String message;

        title = 'Invalid Confirmation Password';
        message = 'The password confirmation you entered is incorrect';
        
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
          'Cancel',
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
                    'Change Password',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Old Password Field
                  MyTextField(
                    controller: oldPasswordController,
                    hintText: 'Old Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // New Password Field
                  MyTextField(
                    controller: newPasswordController,
                    hintText: 'New Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // New Password Confirmation Field

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'New Password Confirmation',
                    obscureText: true,
                  ), // Tambahkan field konfirmasi password

                  const SizedBox(height: 15),

                  // Change Password Button
                  MyButton(
                      onTap: () {
                        changePassword();
                      },
                      text: 'Change Password'),

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
