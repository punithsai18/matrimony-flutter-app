import 'package:flutter/material.dart';
import 'package:bright_weddings/Controller/auth_service.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String verificationId = "";

  void requestOTP() {
    AuthService().signInWithPhone(phoneController.text, (String verId) {
      setState(() {
        verificationId = verId;
      });
    });
  }

  void verifyOTP() async {
    try {
      await AuthService().verifyOTP(verificationId, otpController.text);
      print("Login Successful!");
      // Navigate to home screen
    } catch (e) {
      print("Error verifying OTP: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Enter Phone Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: requestOTP,
              child: Text("Request OTP"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter OTP"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyOTP,
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
