import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';
import 'profile.dart'; // To use profileInfo class
import '../components/text_field_large.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final aboutController = TextEditingController();

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
          'Edit Profil',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 18),

              // Header Card View 
              Container(
                // Background Image For The Container (Profile Picture and Account Info Container)
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/pp-bg.JPG'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const SizedBox(height: 25),

                    // Profile Picture
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/profile.JPG',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Account Information
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Column(
                                children: [
                                  // Fullname, role, and Location
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      // Fullname
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          fontFamily: 'Suse',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: 0.8),

                                      // Location
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 14.5,
                                          ),
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 14.5,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 4),

                                  // Row Divider
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),

                                  SizedBox(height: 4),

                                  // Other Info
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ProfileInfo(
                                          number: '3', label: 'Posts'),
                                      ProfileInfo(
                                          number: '5.1K',
                                          label: 'Subscribers'),
                                      ProfileInfo(
                                          number: '180',
                                          label: 'Subscribing'),
                                    ],
                                  ),
                                ],
                              )),
                        )),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              const SizedBox(height:12),

              // Change Profile Picture and Background Picture Buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Change Profile Picture Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 33, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.account_circle_sharp,
                          size: 18, 
                          color: Color(0xFF4285F4)
                          ),

                        SizedBox(width: 4),

                        Text(
                          'Ganti Gambar Profil',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4285F4),
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ),

                  const SizedBox(height:10),

                  // Change Background Picture Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.photo_size_select_actual_rounded,
                          size: 18, 
                          color: Color(0xFF4285F4)
                        ),

                        SizedBox(width: 4),

                        Text(
                          'Ganti Latar Belakang',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4285F4),
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
        
              const SizedBox(height: 30),

              // Title
              const Text(
                'Edit Informasi Akun',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: true, 
              ),

              const SizedBox(height: 25),

              // Name Field
              MyTextField(
                controller: nameController,
                hintText: 'Nama',
                obscureText: false,
              ),

              const SizedBox(height: 3),

              Text(
                'Masukkan nama pengenalan anda, bisa nama lengkap atau nama panggilan',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                softWrap: true, 
              ),

              const SizedBox(height: 12),

              // Location Field
              MyTextField(
                controller: locationController,
                hintText: 'Lokasi',
                obscureText: false,
              ),

              const SizedBox(height: 3),

              Text(
                'Masukkan lokasi tempat anda tinggal (Opsional).',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                softWrap: true, 
              ),

              const SizedBox(height: 12),

              // About Field
              MyTextFieldLarge(
                controller: aboutController,
                hintText: 'Tentang anda',
                obscureText: false,
              ),

              const SizedBox(height: 3),

              Text(
                'Berikan informasi singkat tentang diri anda',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                softWrap: true, 
              ),

              const SizedBox(height: 15),

              // Complete Button
              MyButton(onTap: () {}, text: 'Selesai'),
            ],
          ),
        ),
      )
    );
  }
}