import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostInfo extends StatefulWidget {
  final String imageUrl;

  const PostInfo({
    super.key,
    required this.imageUrl,
  });

  @override
  State<PostInfo> createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  String? caption;
  String? username;
  String? profileImageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPostDetails();
  }

  Future<void> _fetchPostDetails() async {
    try {
      // Searching the upload by matching it with the image URL
      final snapshot = await FirebaseFirestore.instance
          .collection('uploads')
          .where('imageUrl', isEqualTo: widget.imageUrl)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        setState(() {
          caption = data['caption'];
          username = data['username'];
          profileImageUrl = data['profileImageUrl'];
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Error handling
      displayMessage('Error', 'Post not found');
    }
  }

   void displayMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22, 
              fontFamily: 'Roboto', 
              fontWeight: FontWeight.bold
              ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontFamily: 'Roboto', 
              fontSize: 18),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF219ebc)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details', style: TextStyle(fontFamily: 'Roboto')),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(profileImageUrl!),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        username!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Suse', 
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      widget.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    caption!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Suse', 
                    ),
                  ),
                ],
              ),
            ),
          ),
         
    );
  }
}
