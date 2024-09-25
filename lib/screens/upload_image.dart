import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class File {
  // ignore: unused_field
  File? _selectedImage;
}

class _UploadImageState extends State<UploadImage> {
  // ignore: unused_field
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            Text(
              'Click circle below to add photo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xFF4285F4),
              child: Text('click me'),
            ),
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            Text(
              'Add caption below',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            Card(
              color: Colors.blue,
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 19.0,
              ),
              child: ListTile(
                leading: Icon(Icons.message, color: Colors.black),
                title: Text(
                  'write your caption here',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File();
    });
  }
}
