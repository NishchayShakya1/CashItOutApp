// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/privacy.dart';

class PrivacyList extends StatelessWidget {
  const PrivacyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: PrivacyModel.items.length,
        itemBuilder: (context, index) {
          final privacy = PrivacyModel.items[index];
          return PrivacyItem(privacy: privacy).py2();
        });
  }
}

class PrivacyItem extends StatelessWidget {
  final Privacy privacy;

  const PrivacyItem({Key key, this.privacy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(privacy.l,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
        )
      ],
    ).py12();
  }
}
