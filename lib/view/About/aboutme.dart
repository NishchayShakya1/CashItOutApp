// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ui';
import 'package:cashitout/widgets/Components/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redirect_icon/redirect_icon.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Image dart;
  AssetImage nishchay;

  @override
  void initState() {
    super.initState();
    dart = Image.asset(
      "assets/images/Dart.png",
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    );
    nishchay = AssetImage("assets/images/profile.jpeg");
  }

  @override
  void didChangeDependencies() {
    precacheImage(dart.image, context);
    precacheImage(nishchay, context);
    super.didChangeDependencies();
  }

  final double coverHeight = 280;

  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.darkCreamColor,
        elevation: 0.0,
      ),
      backgroundColor: MyTheme.darkCreamColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [buildTop(context, size), buildContent(context, size)],
      ),
    );
  }

  Widget buildContent(BuildContext context, var size) => Column(
        children: [
          const SizedBox(height: 8),
          Text("Nishchay Shakya",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 0.06 * size.width,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
          Text("Flutter Developer",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 0.05 * size.width,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RedirectSocialIcon(
                    url: "https://www.instagram.com/nishchayshakyaa/",
                    icon: FontAwesomeIcons.instagram,
                    circleAvatarColor: MyTheme.darkBluishColor),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RedirectSocialIcon(
                    url: "https://github.com/NishchayShakya1",
                    icon: FontAwesomeIcons.github,
                    circleAvatarColor: MyTheme.darkBluishColor),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RedirectSocialIcon(
                    url: "https://twitter.com/nishchayshakyaa",
                    icon: FontAwesomeIcons.twitter,
                    circleAvatarColor: MyTheme.darkBluishColor),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: RedirectSocialIcon(
                    url: "https://www.linkedin.com/in/nishchayshakya/",
                    icon: FontAwesomeIcons.linkedin,
                    circleAvatarColor: MyTheme.darkBluishColor),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: glassMorphism(context, size),
          ),
          const SizedBox(height: 16),
        ],
      );

  // Widget buildAbout() => Container(
  Widget glassMorphism(BuildContext context, var size) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 24,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.2))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.2))),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("About",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 0.06 * size.width,
                          fontFamily: GoogleFonts.poppins().fontFamily)),
                  const SizedBox(height: 16),
                  // const Text(
                  //   'Sophomore at Indian Institute of Information Technology Kota.\n\nTrying to help more & more people by making Easy to Use Apps using Flutter Framework.',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  Text(
                      "Sophomore at Indian Institute of Information Technology Kota.\n\nTrying to help more & more people by making Easy to Use Apps using Flutter Framework.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 0.04 * size.width,
                          fontFamily: GoogleFonts.poppins().fontFamily)),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildTop(BuildContext context, var size) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage(context, size)),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: dart,
      );

  Widget buildProfileImage(BuildContext context, var size) => CircleAvatar(
        radius: profileHeight * size.width * 0.0026 / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: nishchay,
      );
}
