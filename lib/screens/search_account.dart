import 'package:flutter/material.dart';

class SearchAccount extends StatefulWidget {
  const SearchAccount({super.key});

  @override
  State<SearchAccount> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccount> {

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
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
                        onPressed: () {}, icon: const Text(
                          'Top', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Text(
                          'Posts', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Text(
                          'People', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Text(
                          'Tags', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {}, 
                        icon: const Text(
                          'Videos', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        ) 
                    ),
                    IconButton(
                        onPressed: () {}, 
                        icon: const Text(
                          'Audio', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        )
                    ),
                    IconButton(
                        onPressed: () {}, 
                        icon: const Text(
                          'More', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue,
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                child: Row(
                  children: [
                    Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
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
                            child: 
                                 Image.asset(
                                    'assets/profile.JPG',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          
                        ),
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
                            child: 
                                 Image.asset(
                                    'assets/account.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          
                        ),
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
                            child: 
                                 Image.asset(
                                    'assets/img0.JPG',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          
                        ),
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
                            child: 
                                 Image.asset(
                                    'assets/icon.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          
                        ),
                  ],
                ),
              ),
            ],
          )
        ),
      ]))
    ));
  }
}
