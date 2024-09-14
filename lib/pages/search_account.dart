import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ['Adi', 'Budi', 'Coco', 'Dodi'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var account in searchTerms) {
      if (account.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(account);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var account in searchTerms) {
      if (account.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(account);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final List<Map<String, dynamic>> searchUsers = [
    {
      'username': 'qwerty',
      'fullName': 'qwerty uiop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                filled: true,
                fillColor: Color.fromARGB(255, 39, 39, 39),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: searchUsers.length,
          itemBuilder: (context, index) {
            var data = searchUsers[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(data['profileImageUrl']),
              ),
              title: Text(data['username']),
              subtitle: Text(data['fullName']),
            );
          }),
    );
  }
}