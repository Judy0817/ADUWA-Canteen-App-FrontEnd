import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'Notification.dart';
import 'activity.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;
  bool _isHomeActive = false;
  bool _isProfileActive = true;
  bool _isNotificationActive = false;
  bool _isMenuActive = false;
  String baseUrl = 'http://192.168.250.221:9090';
  //String baseUrl = 'http://10.34.26.42:9090';

  
  Future<String?> getCurrentUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email;
    } else {
      return null;// No user is signed in
    }
  }
  Future<String> fetchUserName(String userEmail) async {
    final String url = '$baseUrl/retrieve_username?email=$userEmail';
    final response = await http.get(Uri.parse(url));

    final dynamic data = json.decode(response.body);

    if (data is String) {
      // Remove double quotation marks from the username
      final userName = data.replaceAll('"', '');

      return userName;
    } else {
      throw Exception('Invalid response format');
    }
  }
  Future<String?> getUserName() async {
    // Get the current user's email
    String? userEmail = await getCurrentUserEmail();

    if (userEmail != null) {
        // Call fetchUserName with the user's email
        String userName = await fetchUserName(userEmail);
        return userName ;

    } else {
      return null;
    }
  }
  String? userEmail;
  String? USERName;
  @override
  void initState() {
    super.initState();
    // Fetch the user's email when the app starts.
    getCurrentUserEmail().then((email) {
      setState(() {
        userEmail = email;
      });
      if (email != null) {
        getUserName().then((userName) {
          setState(() {
            USERName = userName;
          });
        });
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          gap: 8,
          backgroundColor: Colors.black,
          color: Color(0xfff9a825),
          activeColor: Color(0xffffffff),
          tabBackgroundColor: Color.fromRGBO(217, 217, 217, 0.4235294117647059),
          padding: EdgeInsets.all(15),
          onTabChange: (index){
            setState(() {
              _currentIndex = index; // Update the current index when a tab is selected.

              // Update the active states for each tab based on the selected index.
              _isHomeActive = index == 1;
              _isProfileActive = index == 0;
              _isNotificationActive = index == 2;
              _isMenuActive = index == 3;
            });
          },
          tabs:[
            GButton(
              icon: Icons.person,
              text: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isProfileActive,
            ),
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isHomeActive,
            ),

            GButton(
              icon: Icons.notifications,
              text: 'Notification',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isNotificationActive,
            ),

            GButton(
              icon: Icons.menu_outlined,
              text: 'Activity',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityPage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isMenuActive,
            ),
          ]),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: 30,
                              height: 1,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "My Email           : $userEmail",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "My User Name   : $USERName",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //_pages[_currentIndex],
            ],
          ),
        ),
      ),
    );
  }
}
