// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';

class OtherProfile extends StatefulWidget {
  const OtherProfile({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  bool showImages = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '@and',
          style:
              TextStyle(fontSize: 22, fontFamily: 'Suse', color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, size: 24, color: Colors.black),
            onPressed: () {
              // Menampilkan dropdown menu saat tombol diklik
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(
                    100, 100, 0, 0), // Sesuaikan posisi
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text('Tentang akun'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    // Background Image For The Container (Profile Picture and Account Info Container)
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/pp-bg.JPG'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        const SizedBox(height: 25),

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

                        const SizedBox(height: 20),

                        // Account Information
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
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
                                  child: const Column(
                                    children: [
                                      // Fullname, role, and Location
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Fullname
                                          Text(
                                            'Andre',
                                            style: TextStyle(
                                              fontFamily: 'Suse',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(height: 0.8),

                                          // Location
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.grey,
                                                size: 14.5,
                                              ),
                                              Text(
                                                'Location',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14.5,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                      const SizedBox(height: 4),

                                      // Row Divider
                                      const Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),

                                      const SizedBox(height: 4),

                                      // Other Info
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ProfileInfo(
                                              number: '3', label: 'Posts'),
                                          ProfileInfo(
                                              number: '5.1K',
                                              label: 'Subscribers'),
                                          ProfileInfo(
                                              number: '180',
                                              label: 'Subscribing'),
                                        ],
                                      ),
                                    ],
                                  )),
                            )),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star,
                            size: 18, color: Color(0xFF4285F4)),
                        const SizedBox(width: 2),
                        const Text(
                          'Subscribe',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4285F4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),

            // About Section (Flexible pharagraph)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                Flexible(
                  child: Text(
                    'Halo nama saya Andre. Saya adalah fotografer berbasis di Bandung, Indonesia. Saya sudah menempuh dunia fotografi sejak tahun 2016.',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Suse',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ),
              ]),
            ),

            const SizedBox(height: 4),

            const Divider(),

            // Buttons to Choose What to Show (Images/Albums)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Show Images Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showImages = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo,
                        color: showImages
                            ? const Color(0xFF4285F4)
                            : Colors.grey[500],
                      ),
                      const SizedBox(width: 3),
                      Text('Images',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: showImages
                                ? const Color(0xFF4285F4)
                                : Colors.grey[500],
                          ))
                    ],
                  ),
                ),

                const SizedBox(width: 36),

                // Show Albums Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showImages = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: showImages
                            ? Colors.grey[500]
                            : const Color(0xFF4285F4),
                      ),
                      const SizedBox(width: 3),
                      Text('Albums',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: showImages
                                ? Colors.grey[500]
                                : const Color(0xFF4285F4),
                          ))
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            // Showing The Gallery Chosen
            showImages ? _imagesGallery() : _albumGallery(),
          ],
        ),
      ),
    );
  }
}

// Widget for Images Gallery
Widget _imagesGallery() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number Of Images For Each Row
      mainAxisSpacing: 6, // Space Betwen Rows Of Posts
      crossAxisSpacing: 6, // Space Between Columns Of Posts
      childAspectRatio: 1 / 1, // Aspect ratio
    ),

    itemCount: 3, // Number Of Posts

    // Loop To Show Posts
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2.5,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/img$index.JPG',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
  );
}

// Widget for Albums Gallery
Widget _albumGallery() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1, // Number Of Albums For Each Row
      mainAxisSpacing: 8, // Space Betwen Rows Of Gallery
      childAspectRatio: 16 / 9, // Aspect Ratio
    ),

    itemCount: 3, // Number Of Albums

    // Loop To Show Albums
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2.5,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/img$index.JPG',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
  );
}

class ProfileInfo extends StatelessWidget {
  final String number;
  final String label;

  const ProfileInfo({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontFamily: 'Roboto',
            color: Color(0xFF4285F4),
            fontSize: 18.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF4285F4),
              fontSize: 12.5,
            )),
      ],
    );
  }
}
