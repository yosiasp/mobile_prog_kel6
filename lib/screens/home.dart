import 'package:flutter/material.dart';

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
        leading: const Icon(Icons.home_outlined,
            size: 24, color: Colors.black),
        title: const Text(
          'YouGallery',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 24, color: Colors.black),
            onPressed: () {

            },

          ),
        ],
      ),
    );
  }
}
