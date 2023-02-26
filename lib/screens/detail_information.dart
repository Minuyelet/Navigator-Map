import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'buildingInformation.dart';

class detailInfo extends StatelessWidget {
  // final Contents contents;
  String id;


  detailInfo({super.key, required this.id});
  Widget appBarTitle=const Text("",style: TextStyle(color: Colors.black45,fontSize: 17),);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          title: appBarTitle,

          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          backgroundColor: Colors.grey.shade100,
          actions: const [Icon(Icons.arrow_drop_down_outlined)],
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection("Buildings").doc(id).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var doc = snapshot.data!;
                appBarTitle=
                Text(doc['name']);

                return

                 Panorama
             (
               zoom: 1,
                  animSpeed: 1.0,

              child:
            Image(image: NetworkImage(doc["image"]),),
              );
              }
            }


             ),

            //  Padding(padding: EdgeInsets.all(8.0),
            //  child: Text(
            //   contents.name,
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(fontSize: 25.0,fontStyle: FontStyle.italic,color: Colors.orange),
            //  ),
            //  ),
            //  Padding(padding: EdgeInsets.all(8.0),
            //  child: Text(
            //   contents.description,
            //    textAlign: TextAlign.justify,
            //   style: const TextStyle(fontSize: 22.0,fontStyle: FontStyle.italic),
            //  ),
            //  )

            // ],
            );
    // ),
    // );
  }
}
