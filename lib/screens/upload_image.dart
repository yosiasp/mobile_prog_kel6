import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uts_mobile_prog/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final TextEditingController _captionController = TextEditingController();
  String username = '';
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _getUsername();
    _getProfileImage();
  }

  Future<void> _getUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;
        setState(() {
          username = userDoc['username'] ?? '';
        });
      }
    }
  }

  Future<void> _getProfileImage() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;
        setState(() {
          _profileImageUrl = userDoc['profileImageUrl'] ?? '';
        });
      }
    }
  }

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

    displayMessage('Image and caption saved!');
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
        'username': username,
        'profileImageUrl': _profileImageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Update user's document with the new image URL
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String email = user.email ?? '';
        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          DocumentSnapshot userDoc = userSnapshot.docs.first;
          await userDoc.reference.update({
            'uploadedImages': FieldValue.arrayUnion([imageUrl])
          });
        }
      }

      displayMessage('Image and caption sent!');
    } catch (e) {
      displayMessage('Failed to send image and caption: $e');
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
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
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: const Color(0xFF4285F4),
                    child: const Icon(Icons.add_a_photo,
                        size: 50, color: Colors.white),
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'Click above to add photo ☝️',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              // ignore: prefer_const_constructors
              Text(
                'Add caption below 👇',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
                  MyButton(
                    onTap: _saveImageAndCaption,
                    text: 'Save',
                  ),
                  MyButton(
                    onTap: _sendImageAndCaption,
                    text: 'Send',
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
