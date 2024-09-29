import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: 10, // Jumlah post yang ingin ditampilkan
        itemBuilder: (context, index) {
          return const PostWidget();
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

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
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Ganti dengan URL gambar pengguna
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
              'https://via.placeholder.com/600x400', // Ganti dengan URL gambar post
              fit: BoxFit.cover,
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
          // Bagian caption di bawah jumlah likes
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              'This is an amazing caption for the post!',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
        ],
     ),
);
}
}