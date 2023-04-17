import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_wise/utilities/placescreen.dart';

class PlaceCard extends StatelessWidget {
  DocumentSnapshot documentSnapshot;
  PlaceCard({required this.documentSnapshot, super.key});

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
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 5,
            ),
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(documentSnapshot['Image']),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15, top: 265),
            child: Center(
              child: Text(
                documentSnapshot['Name'],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
