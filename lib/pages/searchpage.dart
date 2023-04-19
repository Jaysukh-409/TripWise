import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trip_wise/utilities/searchlist.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool isShowPlace = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(148, 233, 67, 255),
        leading: const Icon(
          Icons.search_rounded,
          color: Colors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: TextField(
            onSubmitted: (String _) {
              setState(() {
                isShowPlace = true;
              });
            },
            controller: searchController,
            decoration: const InputDecoration(
              hintText: "Enter Location to Visit",
              // prefixIcon:
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('places')
              .where('State', isEqualTo: searchController.text)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return SearchList(
                      documentSnapshot: documentSnapshot,
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
