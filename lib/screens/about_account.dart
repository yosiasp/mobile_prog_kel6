import 'package:flutter/material.dart';

class AboutAccount extends StatelessWidget {
  const AboutAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Akun Anda'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
      
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // Profile Picture
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/profile.JPG',
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Username
                  const Text(
                    'Username', // Tolong pasang usernamenya disini yos
                    style: TextStyle(
                      fontFamily: 'Suse',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Divider(),              

                  // Date the account was created
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today, 
                        color: Colors.black,
                        size: 32.0,
                      ),
                      SizedBox(width: 10), 

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Akun dibuat tanggal',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),  

                          Text(
                            '9 Febuari 2024',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),  
                        ]
                      ),
                    ],
                  ),

                const Divider(),      

                ],
              ),
            ),
          ),
        
      ),
    );
  }
}
