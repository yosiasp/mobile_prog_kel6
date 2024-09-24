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
        leading: const Icon(Icons.account_circle_outlined,
            size: 24, color: Colors.black),
        title: const Text(
          'Page Home',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 24, color: Colors.black),
            onPressed: () {

            },

          ),
        ],
      ),
    );
  }
}
