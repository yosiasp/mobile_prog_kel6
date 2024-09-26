import 'package:flutter/material.dart';

class SearchAccount extends StatefulWidget {
  const SearchAccount({super.key});

  @override
  State<SearchAccount> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Search Account",
          ),
        ),
        body: _buildUI());
  }

  Widget _buildUI() {
    return SizedBox.expand(
      child: Column(
        children: [
          _searchBar(),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: const TextField(
        decoration: InputDecoration(
          hintText: "search something",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
