import 'package:flutter/material.dart';
import 'package:custom_text_form_field_plus/custom_text_form_field_plus.dart';

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
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Search",
                          controller: searchController,
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
