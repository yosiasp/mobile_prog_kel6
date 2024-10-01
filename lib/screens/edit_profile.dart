import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import '../components/text_field_large.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final locationController = TextEditingController();
  final aboutController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;

        setState(() {
          firstNameController.text = userDoc['first name'] ?? '';
          lastNameController.text = userDoc['last name'] ?? '';
          usernameController.text = userDoc['username'] ?? '';
          locationController.text = userDoc['location'] ?? '';
          aboutController.text = userDoc['about me'] ?? '';
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userDoc.id)
            .update({
          'first name': firstNameController.text,
          'last name': lastNameController.text,
          'username': usernameController.text,
          'location': locationController.text,
          'about me': aboutController.text,
        });

        // Optionally, show a success message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    }
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
                    'Edit Profil',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Username Field
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // First Name Field
                  MyTextField(
                    controller: firstNameController,
                    hintText: 'Nama depan',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // Last Name Field
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'Nama belakang',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // Location Field
                  MyTextField(
                    controller: locationController,
                    hintText: 'Lokasi',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // About Field
                  MyTextFieldLarge(
                    controller: aboutController,
                    hintText: 'Tentang anda',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // Complete Button
                  MyButton(
                      onTap: () {
                        _updateProfile();
                      },
                      text: 'Selesai'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
