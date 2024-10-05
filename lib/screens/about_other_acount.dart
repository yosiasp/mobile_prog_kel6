import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AboutOtherAccount extends StatelessWidget {
  final String username;

  const AboutOtherAccount({
    super.key,
    required this.username,
  });

  Future<Map<String, dynamic>?> getUserData() async {
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: username)
      .get();

    if (userSnapshot.docs.isNotEmpty) {
      return userSnapshot.docs.first.data() as Map<String, dynamic>?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This Account'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>?>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching user data'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No user data found'));
            }

            final userData = snapshot.data!;
            final username = userData['username'] ?? 'Username';
            final profileImageUrl = userData['profileImageUrl'];
            final accountCreationDate =
                userData['accountCreationDate'] ?? 'Unknown date';

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

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

                    const SizedBox(height: 50),

                    // Username
                    Text(
                      username,
                      style: const TextStyle(
                        fontFamily: 'Suse',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Divider(),

                    // Date the account was created
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                          size: 32.0,
                        ),
                        const SizedBox(width: 10),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Joined in',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                accountCreationDate,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                      ],
                    ),

                    const Divider(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
