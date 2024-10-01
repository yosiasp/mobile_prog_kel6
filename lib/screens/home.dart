import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'notifications.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.home_outlined, size: 24, color: Colors.black),
        title: const Text(
          'YouGallery',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon:
                const Icon(Icons.notifications, size: 24, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('uploads')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No posts available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final post = snapshot.data!.docs[index];
              return PostWidget(
                imageUrl: post['imageUrl'],
                caption: post['caption'],
              );
            },
          );
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String imageUrl;
  final String caption;

  const PostWidget({super.key, required this.imageUrl, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian user info
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 8),
                Text(
                  'Username',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Bagian gambar post
          GestureDetector(
            onTap: () {
              // Tindakan saat gambar di-tap
            },
            child: Image.network(
              imageUrl, // Ganti dengan URL gambar post
              fit: BoxFit.cover,
            ),
          ),
          // Bagian caption di atas jumlah likes
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              caption,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          // Bagian interaksi (like, comment)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // Tindakan saat like di-tap
                      },
                    ),
                    const Text('1,234',
                        style: TextStyle(
                            fontWeight: FontWeight.bold)), // Jumlah likes
                    const SizedBox(width: 16), // Spasi antara like dan comment
                    IconButton(
                      icon: const Icon(Icons.comment_outlined),
                      onPressed: () {
                        // Tindakan saat comment di-tap
                      },
                    ),
                    const Text('123',
                        style: TextStyle(
                            fontWeight: FontWeight.bold)), // Jumlah komentar
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {
                    // Tindakan saat bookmark di-tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
