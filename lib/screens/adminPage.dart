import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/orderDetails.dart';

import '../Reusable/reusable.dart';
import 'home.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
          height: 50,
          width: 300.0,
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
          width: 30,
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

  bool isExpanded = false;

  void handleToggle() {
    setState(() {
      isExpanded = !isExpanded; // Toggle the state
    });
  }

  List names = [
    "Parata",
    "Uludu Wade",
    "Thosai",
    "Rice",
    "Koththu",
    "Noodless",
    "Rolls",
    "Sandwidch",
    "Hoppers",
    "Omlet Bun"
  ];
  List price = [
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100 "
  ];

  List images = [
    "images/noodless.png",
    "images/fries.png",
    "images/noodless.png",
    "images/pizza.png",
    "images/noodless.png",
    "images/noodless.png",
    "images/noodless.png",
    "images/noodless.png",
    "images/noodless.png",
    "images/noodless.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
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
                    horizontal: 15.0,
                    vertical: 35.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text(
                              "Find Your \nFavorite Food",
                              style: TextStyle(
                                fontSize: 30,
                                height: 1,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SearchBar(),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              "Popular Foods - Open Canteen",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 400,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Card(
                                  elevation: 5,
                                  color: Color.fromRGBO(217, 217, 217, 0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              color: Colors.transparent,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                  images[index],
                                                ),
                                                backgroundColor: Colors
                                                    .transparent, // Replace with your asset path
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  names[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  price[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                )
                                              ],
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const orderDetails(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(14, 0, 20, 0),
                              width: 100.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xfff9a825),
                              ),
                              child: Center(
                                child: Text(
                                  'Add Item',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
