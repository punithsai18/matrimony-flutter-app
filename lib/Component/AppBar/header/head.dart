import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/View/New Client Registration/new_client_registration.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';
import 'package:bright_weddings/View/Login/home.dart';
import 'package:bright_weddings/Component/Buttons/header/icon_header.dart';
import 'package:bright_weddings/Component/Dashboard/SideBar/sidebar_tab.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final bool? showDashboard;
  final bool? showLogin;
  final bool? showRegistration;

  Header({
    Key? key,
    this.onNext,
    this.onBack,
    this.showDashboard,
    this.showLogin,
    this.showRegistration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 80.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 134, 253),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Section
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  if (onBack != null)
                    IconButton(
                      onPressed: onBack,
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                  if (onNext != null)
                    IconButton(
                      onPressed: onNext,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                  Expanded(
                    child: IconButtons(),
                  ),
                ],
              ),
            ),

            // Right Section
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (showLogin ?? true)
                      _buildStyledButton(
                        onPressed: () {
                          Get.offAll(() => LoginHome());
                        },
                        startColor: Colors.redAccent,
                        endColor: Colors.deepOrangeAccent,
                        icon: Icons.exit_to_app,
                      ),
                    if (showRegistration ?? true)
                      _buildStyledButton(
                        onPressed: () {
                          Get.to(() => NewClientRegistration());
                        },
                        startColor: Colors.greenAccent,
                        endColor: Colors.lightGreen,
                        icon: Icons.person_add,
                      ),
                    if (showDashboard ?? true)
                      _buildStyledButton(
                        onPressed: () {
                          Get.to(() => Dashboard());
                        },
                        startColor: Colors.blueAccent,
                        endColor: Colors.lightBlue,
                        icon: Icons.dashboard,
                      ),
                    // Adding the menu (hamburger) icon next to the dashboard icon
                    _buildStyledButton(
                      onPressed: () {
                        Get.to(
                            () => SidebarTab()); // Navigate to the MenuBar widget
                      },
                      startColor: Colors.grey,
                      endColor: Colors.grey[700]!,
                      icon: Icons.menu, // Menu (hamburger) icon
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton({
    required VoidCallback onPressed,
    required Color startColor,
    required Color endColor,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [startColor, endColor],
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12.0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(
                12.0), // Adjusted padding for better icon display
            child: Icon(
              icon,
              color: Colors.white,
              size: 15.0, // Increased icon size for better visibility
            ),
          ),
        ),
      ),
    );
  }

  // This is the missing implementation
  @override
  Size get preferredSize =>
      Size.fromHeight(80.0); // Set the height of the header
}