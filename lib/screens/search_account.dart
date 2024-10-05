import 'package:flutter/material.dart';
import 'package:uts_mobile_prog/screens/other_profile.dart';

class SearchAccount extends StatefulWidget {
  const SearchAccount({super.key});

  @override
  State<SearchAccount> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccount> {
  bool showImages = true;

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const OtherProfile();
                                      },
                                    ),
                                  );
                                },
                                child: Icon(Icons.search)),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search here...',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: clearText,
                                  ),
                                ),
                                controller: fieldText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'Top',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'Posts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'People',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'Tags',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'Videos',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'Audio',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Text(
                                  'More',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      showImages ? _imagesGallery() : _albumGallery()
                    ])))));
  }
}

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
