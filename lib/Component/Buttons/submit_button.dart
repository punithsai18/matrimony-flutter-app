import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SubmitButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 3.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: buttonColor,
        ),
        child: Text(
            title,
        style: GoogleFonts.poppins(
          fontSize: 1.0.t,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
