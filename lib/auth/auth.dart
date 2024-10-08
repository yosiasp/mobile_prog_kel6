import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_or_register.dart';
// import 'package:uts_mobile_prog/screens/profile.dart';
import 'package:uts_mobile_prog/auth/main_menu.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainMenu();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
