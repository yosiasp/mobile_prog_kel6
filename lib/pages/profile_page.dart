// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          'Username',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Menampilkan dropdown menu saat tombol diklik
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(
                    100, 100, 0, 0), // Sesuaikan posisi
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Edit Profile'),
                      onTap: () {
                        Navigator.pop(context); // Menutup menu
                        // Aksi untuk Edit Profile
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        Navigator.pop(context); // Menutup menu
                        // Aksi untuk Settings
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        Navigator.pop(context); // Menutup menu sebelum navigasi
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(onTap: () {
                                    Navigator.pop(context);
                                  })),
                        );
                        // Aksi untuk Logout
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Profile Picture
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/profile.JPG'),
                  ),

                  const SizedBox(height: 25),

                  // Account Information
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const ProfileInfo(number: '3', label: 'Posts'),
                        const ProfileInfo(number: '5.1K', label: 'Subscribers'),
                        const ProfileInfo(number: '180', label: 'Subscribing'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF4285F4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),

            // Personal Information
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        )),
                    Text('My bio blablabla',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
            ),

            const Divider(),

            // Gallery Of Posts With Gallery
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6, // Space Betwen Rows
                crossAxisSpacing: 6, // Space Between Columns
              ),

              itemCount: 3, // Number Of Posts

              // Loop to show posts
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2.5,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/img$index.JPG',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String number;
  final String label;

  const ProfileInfo({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(label),
      ],
    );
  }
}
