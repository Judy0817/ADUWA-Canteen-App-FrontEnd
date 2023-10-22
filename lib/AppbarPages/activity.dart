import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:university_canteen/AppbarPages/profilePage.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'Notification.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _currentIndex = 0;
  bool _isHomeActive = false;
  bool _isProfileActive = true;
  bool _isNotificationActive = false;
  bool _isMenuActive = false;
  List<Map<String, dynamic>> dataList = [];
  String baseUrl = 'http://192.168.250.221:9090';

  Future<double> fetchTotalPrice() async {
    final response = await http.get(Uri.parse('$baseUrl/get_total_price2'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final double totalPrice = double.parse(data['total_price'].toString());
      return totalPrice;
    } else {
      throw Exception('Failed to load total price');
    }
  }
  Future<void> retrieveData() async {
    final String url = '$baseUrl/retrieve_bucket';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      setState(() {
        dataList = List<Map<String, dynamic>>.from(data);
      });
    } else {
      print('Error retrieving data: ${response.body}');
    }
  }
  Future<void> fetchData() async {
    await retrieveData(); // Wait for retrieveData to complete before moving to fetchTotalPrice
    await fetchTotalPrice(); // Wait for fetchTotalPrice to complete
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call a combined function to retrieve data and fetch total price
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
          onTabChange: (index) {
            setState(() {
              _currentIndex =
                  index; // Update the current index when a tab is selected.

              // Update the active states for each tab based on the selected index.
              _isHomeActive = index == 1;
              _isProfileActive = index == 0;
              _isNotificationActive = index == 2;
              _isMenuActive = index == 3;
            });
          },
          tabs: [
            GButton(
              icon: Icons.person,
              text: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage(), // Replace HomeScreen with your destination screen.
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
                    builder: (context) =>
                        Home(), // Replace HomeScreen with your destination screen.
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
                    builder: (context) =>
                        NotificationPage(), // Replace HomeScreen with your destination screen.
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
                    builder: (context) =>
                        ActivityPage(), // Replace HomeScreen with your destination screen.
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your Activies",
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        width: 400,
                        height: 400,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ADUWA - FOOD',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('More Information : Completed.'),
                            SizedBox(height: 10),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              child: ListView.builder(
                                itemCount: dataList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) => Container(
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        dataList[index]['FoodName'],
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Rs. ' + dataList[index]['Price'].toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                           ),
                                      ),
                                      trailing: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width *0.05
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dataList[index]['Quantity'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context).size.width *0.07
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dataList[index]['SubTotal'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xfff9a825),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Spacer(),
                                FutureBuilder<double>(
                                  future: fetchTotalPrice(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // Show a loading indicator while waiting for the result.
                                    }else if (snapshot.hasError) {
                                      print('Error: ${snapshot.error}'); // Log the error to the console.
                                      return Text(
                                        '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      );
                                    } else {
                                      final totalPrice = snapshot.data ?? 0.0; // Default to 0.0 if data is null.
                                      return Text(
                                        'Rs. '+(totalPrice+50.00).toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
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
