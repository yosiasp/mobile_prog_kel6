import 'package:flutter/material.dart';
import 'package:custom_text_form_field_plus/custom_text_form_field_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uts_mobile_prog/firebase_options.dart';

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
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Search...",
                          controller: searchController,
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
    StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {
          List<Row> userWidgets = [];
          if (snapshot.hasData) {
            final users = snapshot.data?.docs.reversed.toList();
            for (var user in users!) {
              final userWidget = Row(
                children: [
                  Text(user['username']),
                ],
              );
              userWidgets.add(userWidget);
            }
          }
        }
      );
  }
}
