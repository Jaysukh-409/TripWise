import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_wise/utilities/placescreen.dart';

class SearchList extends StatelessWidget {
  DocumentSnapshot documentSnapshot;
  SearchList({required this.documentSnapshot, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => PlaceScreen(
          imgurl: documentSnapshot['Image'],
          name: documentSnapshot['Name'],
          state: documentSnapshot['State'],
          time: documentSnapshot['Time'],
          description: documentSnapshot['Description'],
          district: documentSnapshot['District'],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
          bottom: 5,
        ),
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(107, 255, 179, 179),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                documentSnapshot['Name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  documentSnapshot['District'],
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                Text(
                  documentSnapshot['State'],
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
