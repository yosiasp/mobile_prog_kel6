import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_profile.dart';
import 'settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showImages = true;
  String email = '';
  String firstname = '';
  String lastname = '';
  String username = '';
  String location = '';
  String aboutMe = '';
  String profileImageUrl = '';
  List<String> uploadedImages = [];

  // ignore: non_constant_identifier_names
  List<String> docIDs = [];

  Future<void> getDocIDs() async {
    // Added return type
    await FirebaseFirestore.instance
        .collection('users')
        .get()

        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((element) {
              // ignore: avoid_print
              print(element.reference);
            }));
  }

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        email = user.email ?? '';
      });

      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;

        setState(() {
          firstname = userDoc['first name'] ?? '';
          lastname = userDoc['last name'] ?? '';
          username = userDoc['username'] ?? '';
          aboutMe = userDoc['about me'] ?? '';
          location = userDoc['location'] ?? '';
          profileImageUrl = userDoc['profileImageUrl'] ?? '';
          uploadedImages = List<String>.from(userDoc['uploadedImages'] ?? []);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    getDocIDs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.account_circle_outlined,
            size: 24, color: Colors.black),
        title: Text(
          username, // Ganti email dengan username
          style: const TextStyle(
              fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 24, color: Colors.black),
            onPressed: () {
              // Aksi untuk Settings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
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
                            child: profileImageUrl.isNotEmpty
                                ? Image.network(
                                    profileImageUrl,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
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
                                    color: const Color(0xFFffb703),
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
                                  child: Column(
                                    children: [
                                      // Fullname, role, and Location
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Fullname
                                          Text(
                                            '$firstname $lastname',
                                            style: const TextStyle(
                                              fontFamily: 'Suse',
                                              fontSize: 20,
                                              color: Color(0xFF023047), 
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(height: 0.8),

                                          // Location
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // ignore: prefer_const_constructors
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.grey,
                                                size: 14.5,
                                              ),
                                              Text(
                                                location,
                                                // ignore: prefer_const_constructors
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

                                      const SizedBox(height: 4),

                                      // Row Divider
                                      const Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),

                                      const SizedBox(height: 4),

                                      // Other Info
                                      const Row(
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

                  const SizedBox(height: 25),

                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, size: 18, color:  Color(0xFF219ebc) ),
                        SizedBox(width: 2),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 16,
                            color:  Color(0xFF219ebc),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),

            // About Section (Flexible pharagraph)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                Flexible(
                  child: Text(
                    aboutMe,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Suse',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ),
              ]),
            ),

            const SizedBox(height: 4),

            const Divider(),

            // Buttons to Choose What to Show (Images/Albums)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Show Images Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showImages = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo,
                        color: showImages
                            ? const Color(0xFF219ebc)
                            : Colors.grey[500],
                      ),
                      const SizedBox(width: 3),
                      Text('Images',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: showImages
                                ? const Color(0xFF219ebc)
                                : Colors.grey[500],
                          ))
                    ],
                  ),
                ),

                const SizedBox(width: 36),

                // Show Albums Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showImages = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: showImages
                            ? Colors.grey[500]
                            : const  Color(0xFF219ebc)
                      ),
                      const SizedBox(width: 3),
                      Text('Albums',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: showImages
                                ? Colors.grey[500]
                                : const Color(0xFF219ebc)
                          ))
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            // Showing The Gallery Chosen
            showImages ? _imagesGallery() : _albumGallery(uploadedImages),
          ],
        ),
      ),
    );
  }

  // Widget for Images Gallery
  Widget _imagesGallery() {
    // If there are no images yet
    if (uploadedImages.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No images yet. Start posting!',
            style: TextStyle(fontSize: 18, fontFamily: 'Roboto' ,color: Colors.grey),
          ),
        ),
      );
    } 

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 1 / 1,
      ),
      itemCount: uploadedImages.length,

      // Loop To Show Posts
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
              child: Image.network(
                uploadedImages[index],
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget for Albums Gallery
  Widget _albumGallery(List<String> images) {
    // if there are no albums yet
     if (images.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Create your album here!',
            style: TextStyle(fontSize: 18, fontFamily: 'Roboto' ,color: Colors.grey),
          ),
        ),
      );
    } 

    // Accept images as a parameter
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 8,
        childAspectRatio: 16 / 9,
      ),

      itemCount: images.length,

      // Loop To Show Albums
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
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
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
            color: Color(0xFF4285F4),
            fontSize: 18.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF4285F4),
              fontSize: 12.5,
            )),
      ],
    );
  }
}
