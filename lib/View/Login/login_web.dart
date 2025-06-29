import 'package:bright_weddings/Component/Forms/login_form.dart';
import 'package:bright_weddings/Component/footer.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import '../../Component/AppBar/header.dart';
import '../../Helper/colors.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        //showDashboard: false,
        //showLogin: false,
        //showRegistration: false,
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 5.0.h,
              ),
              Center(child: LoginForm(),),
              SizedBox(
                height: 10.0.h,
              ),
              Footer(),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image(
              image: AssetImage(
                'assets/images/leaves.png',
              ),
              height: 17.h,
              width: 28.w,
            ),
          ),
        ],
      ),
    );
  }
}
