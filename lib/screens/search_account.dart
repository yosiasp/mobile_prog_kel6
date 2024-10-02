import 'package:flutter/material.dart';

class SearchAccount extends StatefulWidget {
  const SearchAccount({super.key});

  @override
  State<SearchAccount> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccount> {
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
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        suffixIcon: Icon(Icons.clear),
                      ),
                    )),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
