import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xFF4285F4),
            ),
          ],
        ),
      ),
    );
  }
}
