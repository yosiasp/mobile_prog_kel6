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
              label: 'Home',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Post',
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
              ),
        ],
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, 
        iconSize: 30,
        currentIndex: screenIndex,
        selectedItemColor: const Color(0xFF4285F4),
        onTap: setIndex,
        elevation: 50, 
      ),
    );
  }
}