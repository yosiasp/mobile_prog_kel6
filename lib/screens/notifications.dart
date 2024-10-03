import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
 
  // Notifications Content Example
  final List<Map<String, String>> notifications = [
    {
      'username': '@username',
      'description': 'mengikuti anda',
      'date': '12 Okt 2024',
      'profile': 'assets/account.png' 
    },
    {
      'username': '@username',
      'description': 'memberikan like pada foto anda',
      'date': '7 Des 2024',
      'profile': 'assets/account.png' 
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
    {
      'username': '@username',
      'description': 'mengomentari kiriman anda',
      'date': '5 Feb 2024',
      'profile': 'assets/account.png'
    },
  ];

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
          'Notifications',
          style: TextStyle(
              fontSize: 22, fontFamily: 'Roboto', color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: notifications.length,
          // Loop to build each notification widget
          itemBuilder: (context, index) {
            var notification = notifications[index];
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns everything to the top
                  children: [
                    // Square Profile Picture 
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle, 
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(notification['profile']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Username and Description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification['username']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            notification['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    // Date
                    Text(
                      notification['date']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Divider(), 
              ],
            );
          },
        ),
      ),
    );
  }
}
