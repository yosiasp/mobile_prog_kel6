import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final locationController = TextEditingController();
  final aboutMeController = TextEditingController();
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadProfileImage() async {
    if (_profileImage == null) return null;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_images/${emailController.text}.jpg');
    await storageRef.putFile(_profileImage!);
    return await storageRef.getDownloadURL();
  }

  void daftar() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Check if all fields are filled
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        ageController.text.isEmpty ||
        usernameController.text.isEmpty ||
        locationController.text.isEmpty ||
        aboutMeController.text.isEmpty ||
        _profileImage == null) {
      Navigator.pop(context);
      displayMessage('Cannot Create Account','Every field must be filled and profile picture must be added');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessage('Cannot Create Account','The confirmation password is incorrect!');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final profileImageUrl = await _uploadProfileImage();

  await createUserInFirebase(
    firstNameController.text,
    lastNameController.text,
    int.parse(ageController.text),
    emailController.text,
    usernameController.text,
    locationController.text,
    aboutMeController.text,
    profileImageUrl,
    [] // Empty list for uploadingImages (no image post by account yet)
  );

      if (mounted) {
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => const MainMenu()));
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }
    } on FirebaseAuthException {
      if (mounted) {
        Navigator.pop(context);
        displayMessage('Error', 'An error occured. Please try again');
      }
    }
  }

  Future<void> createUserInFirebase(
      String firstName,
      String lastName,
      int age,
      String email,
      String username,
      String location,
      String aboutMe,
      String? profileImageUrl, 
      List uploadedImages
      ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
      'username': username,
      'accountCreationDate': DateTime.now().toString(),
      'location': location,
      'about me': aboutMe,
      'profileImageUrl': profileImageUrl,
      'uploadedImages' : uploadedImages,
    });
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
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/register-bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      color: Colors.white.withOpacity(0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),

                      // Account Icon
                      GestureDetector(
                        onTap: _pickImage,
                        child: ClipRRect(
                          // Added ClipRRect for border radius
                          borderRadius:
                              BorderRadius.circular(15), // Set border radius
                          child: Container(
                            // Changed CircleAvatar to Container
                            width: 100, // Set width for square shape
                            height: 100, // Set height for square shape
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15), // Set border radius
                              image: DecorationImage(
                                image: _profileImage != null
                                    ? FileImage(_profileImage!)
                                    : const AssetImage('assets/account.png')
                                        as ImageProvider,
                                fit: BoxFit.cover, // Ensure the image covers th
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // App Title
                      const Text(
                        'YouGallery',
                        style: TextStyle(
                          fontFamily: 'Suse',
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              offset: Offset(5, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // App Quote
                      const Text(
                        'Share your Gallery, Share YOU',
                        style: TextStyle(
                          fontFamily: 'Suse',
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 100),

                      // Register title
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Register New Account',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      MyTextField(
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),
                      MyTextField(
                        controller: firstNameController,
                        hintText: 'First Name',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: lastNameController,
                        hintText: 'Last name',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),
                      MyTextField(
                        controller: ageController,
                        hintText: 'Age',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: locationController,
                        hintText: 'Location',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: aboutMeController,
                        hintText: 'About YOU',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // Username Field
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
                        hintText: 'Password confirmation',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Sign Up Button
                      MyButton(onTap: daftar, text: 'Register'),

                      const SizedBox(height: 25),

                      // Login Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Login now',
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
