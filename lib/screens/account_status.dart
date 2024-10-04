import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountStatus extends StatefulWidget {
  const AccountStatus({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountStatusState createState() => _AccountStatusState();
}

class _AccountStatusState extends State<AccountStatus> {
  String username = '';
  String profileImageUrl = '';

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';

      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        var userDoc = userSnapshot.docs.first;

        setState(() {
          username = userDoc['username'] ?? 'Username';
          profileImageUrl = userDoc['profileImageUrl'] ?? '';
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Account Status'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontFamily: 'Suse',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 25),

                const Divider(),

                // Date the account was created
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 32.0,
                    ),
                    SizedBox(width: 10),
                    Expanded(  
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,  
                        children: [
                          Text(
                            'Your account does not have any problems',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            softWrap: true,  
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
