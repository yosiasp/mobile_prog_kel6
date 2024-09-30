import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final TextEditingController _captionController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveImageAndCaption() async {
    if (_image == null || _captionController.text.isEmpty) return;

    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/uploaded_image.png';
    final captionPath = '${directory.path}/caption.txt';

    await _image!.copy(imagePath);

    final captionFile = File(captionPath);
    await captionFile.writeAsString(_captionController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image and caption saved!')),
    );
  }

  Future<void> _sendImageAndCaption() async {
    if (_image == null || _captionController.text.isEmpty) return;

    try {
      final storageRef = FirebaseStorage.instance
          .refFromURL('gs://uts-mobile-prog.appspot.com/image')
          .child('${DateTime.now().millisecondsSinceEpoch}.png');
      final uploadTask = storageRef.putFile(_image!);
      final snapshot = await uploadTask.whenComplete(() => null);
      final imageUrl = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('uploads').add({
        'imageUrl': imageUrl,
        'caption': _captionController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image and caption sent!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send image and caption: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_image != null)
                CircleAvatar(
                  radius: 100,
                  backgroundImage: FileImage(_image!),
                ),
              const SizedBox(height: 20),
              const Text(
                'Click circle below to add photo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: const Color(0xFF4285F4),
                  child: _image == null
                      ? const Icon(Icons.add_a_photo,
                          size: 50, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Add caption below',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              Card(
                color: Colors.blue[50],
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _captionController,
                    decoration: const InputDecoration(
                      hintText: "Write your caption here",
                      prefixIcon: Icon(Icons.message, color: Colors.blue),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveImageAndCaption,
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: _sendImageAndCaption,
                    child: const Text('Send'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
