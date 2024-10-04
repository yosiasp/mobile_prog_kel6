import 'package:flutter/material.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({super.key});

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.bookmark, size: 24, color: Colors.black), 
            SizedBox(width: 5), 
            Text(
              'Your Saved Posts',
              style: TextStyle(
                fontSize: 22, 
                fontFamily: 'Roboto',
                color: Colors.black
                ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: _imagesGallery(),
          ),
        ],
      ),
    );
  }
  
  // Widget for Images Gallery
  Widget _imagesGallery() {
   int imageCount = 3; // Number of images to show

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 1 / 1,
      ),
      itemCount: imageCount, 

      // Loop To Show Images
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
    );
  }
}
