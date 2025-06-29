import 'package:flutter/material.dart';
import 'package:bright_weddings/View/Dashboard/dashboard_mob.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Ensure GetX is imported for navigation
import 'package:bright_weddings/View/Login/home.dart';
import 'package:bright_weddings/Component/EditProfileComponent/edit_profile_form.dart';
 // Adjust if the file location changes
 // Import the EditProfileForm

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  int _currentIndex = 3; // Start with Profile screen as the default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.kodchasan(
            height: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            _buildProfileHeader(),

            // Profile Information Section
            _buildProfileInfo(context),

            // Action Buttons
            _buildActionButtons(context),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Track the selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          // Use Get.to() for navigation
          switch (index) {
            case 0: // Home
              Get.off(() => DashboardMob()); // Use Get.off to remove the current page from the stack
              break;
            case 1: // Matches
              Get.off(() => ()); // Replace with your Matches screen
              break;
            case 2: // New Button
              Get.off(() => ()); // Replace with your NewScreen
              break;
            case 3: // Profile
              Get.off(() => ProfileDetails()); // Navigates to ProfileDetails
              break;
          }
        },
        selectedItemColor: Colors.redAccent, // Set the color for the selected item
        unselectedItemColor: Colors.grey, // Set the color for the unselected items
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
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/loginCouple.png'),
          ),
          const SizedBox(height: 10),
          Text(
            "John Doe", // Replace with dynamic name
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "johndoe@example.com", // Replace with dynamic email
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInfoRow("Name", "John Doe"),
              const Divider(),
              _buildInfoRow("Email", "johndoe@example.com"),
              const Divider(),
              _buildInfoRow("Phone", "+1234567890"),
              const Divider(),
              _buildInfoRow("Address", "123, Wedding Street, Bliss City"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // Edit Profile Button
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to the EditProfileForm screen
              Get.to(() => EditProfileForm()); // Assuming EditProfileForm is a separate widget
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            icon: const Icon(Icons.edit, color: Colors.white),
            label: const Text(
              "Edit Profile",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),

          // Logout Button
          ElevatedButton.icon(
            onPressed: () {
              // Handle Logout
              Get.to(() => LoginHome());
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.redAccent,
            ),
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text(
              "Logout",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
