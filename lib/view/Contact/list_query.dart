import 'dart:developer';

import 'package:cashitout/widgets/Components/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controller/Email/email.dart';

class ListQueryPage extends StatefulWidget {
  const ListQueryPage({Key key}) : super(key: key);

  @override
  State<ListQueryPage> createState() => _ListQueryPageState();
}

class _ListQueryPageState extends State<ListQueryPage> {
  final Stream<QuerySnapshot> tokenStream = (FirebaseFirestore.instance
      .collection('particularUserQuery')
      .doc(LevelUp().myTest.toString())
      .collection(LevelUp().myTest.toString())
      .orderBy('createdAt', descending: true)
      .snapshots());

  // For Deleting User
  CollectionReference query = FirebaseFirestore.instance
      .collection('particularUserQuery')
      .doc(LevelUp().myTest.toString())
      .collection(LevelUp().myTest.toString());

  Future<void> deleteQuery(id) {
    // print("User Deleted $id");
    return query
        .doc(id)
        .delete()
        .then((value) => log('User Deleted'))
        .catchError((error) => log('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: tokenStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('Something went Wrong');
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storequerydocs = [];
          snapshot.data.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storequerydocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 0),
                      shrinkWrap: true,
                      itemCount: storequerydocs.length,
                      itemBuilder: (context, i) {
                        return VxBox(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Date : ${storequerydocs[i]['date'].toString()}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 0.05 * size.width,
                                          fontFamily: GoogleFonts.poppins()
                                              .fontFamily)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            backgroundColor: MyTheme.creamColor,
                                            title: Text("Query",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 0.04 * size.width,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily)),
                                            content: Text(
                                                'Are you sure want to Delete ?',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 0.04 * size.width,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily)),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    deleteQuery(
                                                        storequerydocs[i]
                                                            ['id']);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Delete',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              0.03 * size.width,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily)))
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: MyTheme.darkCreamColor,
                                      ))
                                ],
                              ),
                              Text(
                                  "UPI : ${storequerydocs[i]['upi'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                              Text(
                                  "Query :- \n${storequerydocs[i]['query'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                               Text(
                                  "Status : ${storequerydocs[i]['status'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily))
                            ],
                          ),
                        )).color(Colors.blueGrey).rounded.make().py16().px0();
                      })),
            ],
          );
        });
    //     ),
    //   ),
    // );
  }
}
