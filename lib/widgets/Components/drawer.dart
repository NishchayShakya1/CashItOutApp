// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashitout/view/Contact/query_page.dart';
import 'package:cashitout/view/Token/token_page.dart';
import 'package:cashitout/widgets/Components/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controller/Drawer/switch_controller.dart';
import '../../view/About/about_page.dart';
import '../../view/About/aboutme.dart';
import '../../view/Contact/contact_page.dart';
import '../../view/Faq/faq_page.dart';
import '../../view/Privacy/privacy_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  SwitchX sx = Get.put(SwitchX());
  @override
  void initState() {
    sx.toggle(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // final imageUrl = "https://avatars.githubusercontent.com/u/75979530?v=4";
    return Drawer(
      child: Container(
        color: MyTheme.darkCreamColor,
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            const HeightBox(25),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: user?.photoURL ??
                          "https://raw.githubusercontent.com/NishchayShakya1/images/main/rupee.png",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                user?.displayName ?? "Unknown",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                user?.email ?? "Unknown",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            const HeightBox(5),
            
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  sx.toggle(0);
                },
                leading: Obx(() {
                  return Icon(
                    Icons.money_sharp,
                    color: sx.on.value == 0
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                //network

                title: Obx(
                  () {
                    return Text("Tokens",
                        style: TextStyle(
                            color: sx.on.value == 0
                                ? MyTheme.lightBluishColor
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: GoogleFonts.poppins().fontFamily));
                  },
                ),
              ),
            ),
            

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirebaseFuture()),
                );
                sx.toggle(1);
              }, leading: Obx(() {
                return Icon(
                  Icons.account_balance_wallet_sharp,
                  color: sx.on.value == 1
                      ? MyTheme.lightBluishColor
                      : Colors.white,
                );
              }),
                  //network

                  title: Obx(() {
                return Text("My Tokens",
                    style: TextStyle(
                        color: sx.on.value == 1
                            ? MyTheme.lightBluishColor
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: GoogleFonts.poppins().fontFamily));
              })),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactPage()),
                  );
                  sx.toggle(2);
                },
                leading: Obx(() {
                  return Icon(
                    Icons.support_agent_sharp,
                    color: sx.on.value == 2
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                //network

                title: Obx(() {
                  return Text("Assistance",
                      style: TextStyle(
                          color: sx.on.value == 2
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirebaseQueryFuture()),
                  );
                  sx.toggle(3);
                },
                leading: Obx(() {
                  return Icon(
                    Icons.question_mark,
                    color: sx.on.value == 3
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                //network

                title: Obx(() {
                  return Text("My Queries",
                      style: TextStyle(
                          color: sx.on.value == 3
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                  sx.toggle(4);
                },
                leading: Obx(() {
                  return Icon(
                    Icons.info_outline,
                    color: sx.on.value == 4
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                //network

                title: Obx(() {
                  return Text("About App",
                      style: TextStyle(
                          color: sx.on.value == 4
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPage()),
                  );
                  sx.toggle(5);
                },
                leading: Obx(() {
                  return Icon(
                    Icons.privacy_tip_outlined,
                    color: sx.on.value == 5
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                //network

                title: Obx(() {
                  return Text("Privacy",
                      style: TextStyle(
                          color: sx.on.value == 5
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FaqPage()),
                  );
                  sx.toggle(6);
                },
                leading: Obx(() {
                  return Icon(
                    Icons.question_answer_sharp,
                    color: sx.on.value == 6
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                //network

                title: Obx(() {
                  return Text("FAQ",
                      style: TextStyle(
                          color: sx.on.value == 6
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () async {
                  const urlPreview =
                      'https://play.google.com/store/apps/details?id=com.nishchay.cashitout';
                  await Share.share(
                      'Now, No More Worries!\n\nTransfer Your Google Play Money to Your UPI.\n\nDownload the App Now ↓\n\n$urlPreview');
                },
                leading: Obx(() {
                  return Icon(
                    Icons.share,
                    color: sx.on.value == 7
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                title: Obx(() {
                  return Text("Share",
                      style: TextStyle(
                          color: sx.on.value == 7
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                  sx.toggle(8);
                },
                leading: Obx(() {
                  return Icon(
                    CupertinoIcons.profile_circled,
                    color: sx.on.value == 8
                        ? MyTheme.lightBluishColor
                        : Colors.white,
                  );
                }),
                title: Obx(() {
                  return Text("About Me",
                      style: TextStyle(
                          color: sx.on.value == 8
                              ? MyTheme.lightBluishColor
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget tiles (int toggle, String title, Navigator navigator){
  //   return Padding(
  //             padding: const EdgeInsets.all(4.0),
  //             child: ListTile(
  //               onTap: () {
  //                 Navigator.of(context).pop();
  //                 sx.toggle(0);
  //               },
  //               leading: Obx(() {
  //                 return Icon(
  //                   Icons.money_sharp,
  //                   color: sx.on.value == 0
  //                       ? MyTheme.lightBluishColor
  //                       : Colors.white,
  //                 );
  //               }),
  //               //network

  //               title: Obx(
  //                 () {
  //                   return Text("Tokens",
  //                       style: TextStyle(
  //                           color: sx.on.value == 0
  //                               ? MyTheme.lightBluishColor
  //                               : Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 20,
  //                           fontFamily: GoogleFonts.poppins().fontFamily));
  //                 },
  //               ),
  //             ),
  //           );
  // }
}
