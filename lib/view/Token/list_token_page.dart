import 'package:cashitout/widgets/Components/catalog_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controller/Email/email.dart';

class ListTokenPage extends StatefulWidget {
  const ListTokenPage({Key key}) : super(key: key);

  @override
  State<ListTokenPage> createState() => _ListTokenPageState();
}

class _ListTokenPageState extends State<ListTokenPage> {
  final Stream<QuerySnapshot> tokenStream = (FirebaseFirestore.instance
      .collection('particularUser')
      .doc(LevelUp().myTest.toString())
      .collection(LevelUp().myTest.toString())
      .orderBy('createdAt', descending: true)
      .snapshots());

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

          final List storedocs = [];
          snapshot.data.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
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
                      itemCount: storedocs.length,
                      itemBuilder: (context, i) {
                        // Contest user = list[index];
                        // final catalog = CatalogModel.getbyPosition(index);
                        return VxBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CatalogImage(),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Rs. ${storedocs[i]['token'].toString()}",
                                        style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 0.04 * size.width,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily)),
                                    Text(storedocs[i]['status'].toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 0.04 * size.width,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily))
                                        .pOnly(right: 15.0),
                                  ],
                                ),
                                Text(storedocs[i]['upi'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 0.03 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily)),
                                Text(storedocs[i]['date'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 0.03 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily)),
                                Text(storedocs[i]['time'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 0.03 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily)),
                                Text(
                                    "Token Price : ${storedocs[i]['tokenPrice'].toString()}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 0.03 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily)),
                              ],
                            ))
                          ],
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
