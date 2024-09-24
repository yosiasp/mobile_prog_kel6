import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/search_account.dart';
import '../screens/upload_image.dart';
import '../screens/profile.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  int screenIndex = 0;
  static List<Widget> screenOptions = <Widget>[
    const Home(),
    const SearchAccount(),
    const UploadImage(),
    const Profile(),
  ];

  void setIndex(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenOptions.elementAt(screenIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ' ',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ' ',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: '',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: ' ',
              ),
        ],
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false, // Tidak tampilkan label
        iconSize: 30,
        currentIndex: screenIndex,
        selectedItemColor: Colors.black,
        onTap: setIndex,
        elevation: 50, 
      ),
    );
  }
}