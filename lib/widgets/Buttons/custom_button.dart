import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/themes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color buttonColor;

  const CustomButton({
    Key key,
    this.text,
    this.onTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80),
      child: SizedBox(
        width: 120,
        height: size.height * 0.06,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: buttonColor ?? MyTheme.lightBluishColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: onTap,
            child: Center(
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 0.05 * size.width,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
            )),
      ),
    );
  }
}
