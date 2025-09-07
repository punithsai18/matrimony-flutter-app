import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Dashboard/Recent_Success/recent_success.dart';
import 'package:bright_weddings/View/Profile/ProfileDetails/profile_details.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/profile_list_tab.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Component/Dashboard/New Profile/new_profile_tab.dart';
import '../../Component/Dashboard/ProfileCompletionStatus/profile_completion_status.dart';
import '../../Component/Dashboard/ProfileStatus/profile_status.dart';
import '../../Mock API/user_list.dart';
import 'package:bright_weddings/View/Discover/discover_page.dart';
import 'package:bright_weddings/Component/Dashboard/Discover/discover_section.dart';

class DashboardMob extends StatefulWidget {
  DashboardMob({super.key});

  @override
  _DashboardMobState createState() => _DashboardMobState();
}

class _DashboardMobState extends State<DashboardMob> {
  final ScreenController controller = Get.find<ScreenController>();
  int _currentIndex = 0; // Track the index of the selected item

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewAllButton() {
    return TextButton(
      onPressed: () {},
      child: Text('Viewall'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Find your perfect',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Match!',
                    style: GoogleFonts.kodchasan(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for partner',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoiceChip(label: Text('Age'), selected: false),
                      ChoiceChip(label: Text('Mothertongue'), selected: false),
                      ChoiceChip(label: Text('Religion'), selected: false),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle('Near You'),
                      _viewAllButton(),
                    ],
                  ),

                  SizedBox(height: 16),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            'assets/images/download.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'James',
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'India, Delhi',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Chartered Accountant',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle(
                          'New Profiles'), // Use the custom function here
                      _viewAllButton(),
                    ],
                  ),
                  NewProfileTab(bodyContext: context),
                  SizedBox(height: 3.0.h),

                  // Recent Success Section
                  SizedBox(height: 2.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle(
                          'Recent Success'), // Use the custom function here
                      _viewAllButton(),
                    ],
                  ),
                  RecentSuccess(userList: userList),
                  SizedBox(height: 3.0.h),

                  // Profile List Section
                  SizedBox(height: 2.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle(
                          'Profile List'), // Use the custom function here
                      _viewAllButton(),
                    ],
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width),
                      child: ProfileListTab(),
                    ),
                  ),
                  SizedBox(height: 3.0.h),

                  // Profile Status Section
                  SizedBox(height: 2.0.h),
                  _buildSectionTitle(
                      'Profile Status'), // Use the custom function here
                  Column(
                    children: [
                      ProfileStatus(),
                      SizedBox(height: 1.0.h),
                      ProfileCompletionStatus(),
                    ],
                  ),
                  SizedBox(height: 5.0.h),

                  SizedBox(height: 2.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle('Discover Matches'),
                      _viewAllButton(), // Optional: you can hook this to navigate to full screen
                    ],
                  ),
                  DiscoverSection(), // 👈 Here’s your embedded Discover cards
                ],
              ),
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Track the selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          // Use Get.to() for navigation
          switch (index) {
            case 0: // Home
              // Already on home, no need to navigate
              break;
            case 1: // Matches
              Get.to(() => DiscoverPage()); // 👈 Add this
              break;
            case 2: // Messages
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Messages feature coming soon!")),
              );
              break;
            case 3: // Profile
              Get.to(() => ProfileDetails());
              break;
            case 4: // Discover
              Get.to(() => DiscoverPage());
              break;
          }
        },
        selectedItemColor:
            Colors.redAccent, // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
        type: BottomNavigationBarType.fixed, // This allows more than 3 items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined), // New button
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
        ],
      ),
    );
  }
}
