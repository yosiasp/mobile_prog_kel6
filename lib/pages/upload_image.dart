import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Upload Image",
          ),
        ),
        body: _buildUI());
  }

  Widget _buildUI() {
    return SizedBox.expand(
      child: Column(
        children: [
          _searchBar(),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TextField(
        decoration: const InputDecoration(
          hintText: "search something",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
