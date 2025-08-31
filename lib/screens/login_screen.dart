import 'package:flutter/material.dart';
// Make sure this path is correct for your project structure
import 'package:bright_weddings/Controller/auth_service.dart';
import 'package:bright_weddings/core/app_constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers to manage the text in the TextFields
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // State variable to hold the verification ID from Firebase
  String verificationId = "";

  // --- Logic Methods ---

  // Method to request OTP from the authentication service
  void requestOTP() {
    // We would add validation here in the next step
    AuthService().signInWithPhone(phoneController.text, (String verId) {
      setState(() {
        verificationId = verId;
      });
      // Optionally, show a success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP has been sent!')),
      );
    });
  }

  // Method to verify the entered OTP
  void verifyOTP() async {
    try {
      await AuthService().verifyOTP(verificationId, otpController.text);
      print("Login Successful!");
      // TODO: Navigate to the home screen upon successful login
      // Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print("Error verifying OTP: $e");
      // Optionally, show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Invalid OTP')),
      );
    }
  }

  // --- UI Build Method ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        // Use a color from our constants file
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        // Use a padding size from our constants file
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Makes buttons stretch
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Enter Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            // Use a spacing size from our constants file
            SizedBox(height: AppSizes.screenPadding),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Use a color from our constants file
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white, // Set the text/icon color to white
                padding: EdgeInsets.symmetric(vertical: AppSizes.medium),
              ),
              onPressed: requestOTP,
              child: Text("Request OTP"),
            ),
            SizedBox(height: AppSizes.screenPadding),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: AppSizes.screenPadding),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Use a different color for variety
                backgroundColor: AppColors.accentColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: AppSizes.medium),
              ),
              onPressed: verifyOTP,
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}