import 'package:flutter/material.dart';
import '../components/text_field.dart';
import '../components/button.dart';

class SetupAccount extends StatefulWidget {
  const SetupAccount({super.key});

  @override
  State<SetupAccount> createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go Back To The Recent Screen
          },
        ),
        title: const Text(
          '@Username',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 18),
              // Account Logo
              Image.asset(
                'assets/account.png',
                width: 120,
                height: 120,
              ),

              const SizedBox(height: 50),

              // Title
              const Text(
                'Lengkapi Akun Anda',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: true, 
              ),

              const SizedBox(height: 25),

              // Name Field
              MyTextField(
                controller: nameController,
                hintText: 'Nama',
                obscureText: false,
              ),

              const SizedBox(height: 3),

              Text(
                'Masukkan nama pengenalan anda, bisa nama lengkap atau nama panggilan',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                softWrap: true, 
              ),

              const SizedBox(height: 12),

              // Location Field
              MyTextField(
                controller: locationController,
                hintText: 'Lokasi',
                obscureText: false,
              ),

              const SizedBox(height: 3),

              Text(
                'Masukkan lokasi tempat anda tinggal (Opsional).',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                softWrap: true, 
              ),

              const SizedBox(height: 12),

              // Birthday Field
              MyTextField(
                controller: birthdayController,
                hintText: 'Tanggal Ulang Tahun',
                obscureText: false,
              ),

              const SizedBox(height: 3),

              Text(
                'Masukkan tanggal ulang tahun anda.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                softWrap: true, 
              ),

              const SizedBox(height: 15),

              // Complete Button
              MyButton(onTap: () {}, text: 'Selesai'),
            ],
          ),
        ),
      )
    );
  }
}