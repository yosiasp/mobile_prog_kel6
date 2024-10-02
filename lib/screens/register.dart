import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'home.dart';

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

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessage('Password tidak sama');
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
          profileImageUrl);

      if (mounted) {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        Navigator.pop(context);
        displayMessage(e.code);
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
      String? profileImageUrl) async {
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
    });
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
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
                      MyTextField(
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),
                      MyTextField(
                        controller: firstNameController,
                        hintText: 'Nama Depan',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: lastNameController,
                        hintText: 'Nama Belakang',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),
                      MyTextField(
                        controller: ageController,
                        hintText: 'Umur',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: locationController,
                        hintText: 'Lokasi',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: aboutMeController,
                        hintText: 'Tentang Saya',
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
                        hintText: 'Kata Sandi',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Confirm Password Field
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Konfirmasi Kata Sandi',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Sign Up Button
                      MyButton(onTap: daftar, text: 'Daftar'),

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
