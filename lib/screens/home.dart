import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/Reusable/reusable.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:university_canteen/screens/location.dart';
import '../AppbarPages/MenuPage.dart';
import '../AppbarPages/profilePage.dart';
import 'opencanteen.dart';

final double ffem = 45;
const double fem = 10.0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget SearchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.07,
          child: TextField(
            //controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xfff9a825),
                ),
                hintText: 'Search Here',
                hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(217, 217, 217, 0.5),
            ),
            child: Center(
              child: Icon(
                Icons.menu,
                color: Color(0xffffffff),
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
  int _currentIndex=0;
  bool _isHomeActive = true;
  bool _isProfileActive = false;
  bool _isNotificationActive = false;
  bool _isMenuActive = false;


  @override
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
              _isHomeActive = index == 0;
              _isProfileActive = index == 1;
              _isNotificationActive = index == 2;
              _isMenuActive = index == 3;
            });
          },
          tabs:[
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
              icon: Icons.notifications,
              text: 'Notification',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(), // Replace HomeScreen with your destination screen.
                  ),
                );
              },
              active: _isNotificationActive,
            ),

            GButton(
              icon: Icons.phone,
              text: 'Contact',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuPage(), // Replace HomeScreen with your destination screen.
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
                            "Find Your \nFavorite Food",
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
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SearchBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Popular Canteen",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CanteenSet("Open Canteen", "kottu.jpg", () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  OpenCanteen(),
                              ),
                            );
                          }),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          CanteenSet("Gym Canteen", "kottu.jpg", () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  OpenCanteen(),
                              ),
                            );
                          }),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CanteenSet(
                            "Rahula Canteen",
                            "kottu.jpg",
                            () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  OpenCanteen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          CanteenSet(
                            "Green Canteen",
                            "kottu.jpg",
                            () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  OpenCanteen(),
                                ),
                              );
                            },
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
