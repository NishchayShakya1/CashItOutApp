import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        // text.text.xl5.bold.color(Colors.white).textStyle(FontStyle(fo)).make().px2(),
        // ignore: deprecated_member_use
        Text(text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: GoogleFonts.poppins().fontFamily))
      ],
    );
  }
}
