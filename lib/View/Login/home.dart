import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/View/Login/login_mobile.dart';
import 'package:bright_weddings/View/New%20Client%20Registration/new_client_registration.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFA726),
              Color(0xFFFF7043),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/vector_wedding.png',
                    height: 250,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Bright Weddings",
                  style: GoogleFonts.pacifico(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Find your perfect match with our trusted matrimony services.",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                _buildActionButton(
                  icon: Icons.login,
                  label: "Login",
                  colorStart: Color(0xFFF57C00),
                  colorEnd: Color(0xFFE65100),
                  onPressed: () => Get.to(() => LoginMobile()),
                ),
                SizedBox(height: 20),
                _buildActionButton(
                  icon: Icons.app_registration,
                  label: "Register",
                  colorStart: Color(0xFFEF5350),
                  colorEnd: Color(0xFFD32F2F),
                  onPressed: () => Get.to(() => NewClientRegistration()),
                  //onPressed: () => Get.to(() => NewClientRegistration()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color colorStart,
    required Color colorEnd,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: colorStart,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
    );
  }
}
