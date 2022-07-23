import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
 
  final String hintText;
  final String labelText;
  final int maxlines;
  final IconData icon;
 
  CustomTextField(
      {Key key,
      this.controller,
    
      this.hintText,
      this.labelText,
      this.maxlines,
      this.icon,
      })
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 0.045 * size.width,
          fontFamily: GoogleFonts.poppins().fontFamily),
      controller:  controller ,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 0.040 * size.width,
            fontFamily: GoogleFonts.poppins().fontFamily),
        labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 0.05 * size.width,
            fontFamily: GoogleFonts.poppins().fontFamily),
        prefixIcon: Icon(
          icon ?? Icons.account_balance_rounded,
          color: Colors.white,
        ),
        suffixIcon: controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () => controller.clear(),
              ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
      textInputAction: TextInputAction.done,
      maxLines: maxlines,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
       
        return null;
      },
    );
  }
}
