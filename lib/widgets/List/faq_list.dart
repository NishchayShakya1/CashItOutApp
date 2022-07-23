// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/faq.dart';

class FaqList extends StatelessWidget {
  const FaqList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: FaqModel.items.length,
        itemBuilder: (context, index) {
          final faq = FaqModel.items[index];
          return FaqItem(faq: faq).py2();
        });
  }
}

class FaqItem extends StatelessWidget {
  final Faq faq;

  const FaqItem({Key key, this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // faq.q.text.textStyle(context.captionStyle).bold.make().py12().px8(),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(faq.q,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
        ),
        // faq.a.text.textStyle(context.captionStyle).make().py0().px8(),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(faq.a,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
        )
      ],
    ).py(12);
  }
}
