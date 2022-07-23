// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/about.dart';

class AboutList extends StatelessWidget {
  const AboutList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AboutModel.items.length,
        itemBuilder: (context, index) {
          final about = AboutModel.items[index];
          // final catalog = CatalogModel.getbyPosition(index);
          return AboutItem(about: about).py2(); //InkWell(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => HomeDetailPage(catalog: catalog
          //             //CatalogModel.getById(2)
          //             ))),
          // child: AboutItem(about: about));
        });
  }
}

class AboutItem extends StatelessWidget {
  final About about;

  const AboutItem({Key key, this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // about.l.text.textStyle(context.captionStyle).make().py0().px8(),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(about.l,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
        ),
      ],
    ).py12();
  }
}
