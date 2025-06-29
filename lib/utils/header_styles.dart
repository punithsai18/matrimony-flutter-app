import 'package:flutter/material.dart';

class AppStyles {
  // Colors
  static const Color primaryColor = Colors.blueAccent;
  static const Color secondaryColor = Colors.greenAccent;
  static const Color accentColor = Colors.orangeAccent;
  static const Color errorColor = Colors.redAccent;
  
  // Gradient Colors for Buttons
  static const Gradient buttonGradientLogin = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.redAccent, Colors.deepOrangeAccent],
  );
  
  static const Gradient buttonGradientRegister = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.greenAccent, Colors.lightGreen],
  );

  static const Gradient buttonGradientDashboard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blueAccent, Colors.lightBlue],
  );
  
  // Text Styles
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
