import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'Controller/screen_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
// import 'View/Profile/ProfileDetails/profile_details.dart';
import 'View/Dashboard/dashboard_mob.dart';
import 'Helper/size_config.dart';
import 'View/Login/Login/home.dart';
import 'discover_page';
import 'package:bright_weddings/View/Discover/discover_page.dart';
import 'firebase_options.dart';
import 'View/Login/login_mobile.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ScreenController());
  Get.put(NewRegistrationController());
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context2, Orientation orientation) {
            SizeConfig.init(constraints, orientation);  
            return GetMaterialApp(
              title: "Bright Weddings",
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
                primaryColor: Color(0xFFF3D48A),
              ),
              routes: {
                '/': (context) => LoginHome(),
                '/home': (context) => DashboardMob(),
                '/discover': (context) => DiscoverPage(),
                '/LoginMobile': (context) => LoginMobile(),
              },
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
            );
          },
        );
      },
    );
  }
}

