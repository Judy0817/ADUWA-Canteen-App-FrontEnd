import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/viewCart.dart';

import '../Reusable/reusable.dart';
import 'home.dart';

class OpenCanteen extends StatefulWidget {
  const OpenCanteen({Key? key}) : super(key: key);

  @override
  State<OpenCanteen> createState() => _OpenCanteenState();
}

class _OpenCanteenState extends State<OpenCanteen> {
  Widget SearchBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffd9d9d9),
            borderRadius: BorderRadius.circular(50),
          ),
          height: 50,
          width: 350.0,
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
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  bool isExpanded = false;

  void handleToggle() {
    setState(() {
      isExpanded = !isExpanded; // Toggle the state
    });
  }

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
                  color: Color(0x8ed9d9d9),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 35.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                        width: 350.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color(0x66f9a825),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Today What Do You \nWant To Eat?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                    letterSpacing: 2,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 150.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xfff9a825),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Order Now!',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "images/noodless.png",
                                  width: 150,
                                  height: 70,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SearchBar(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 340.0,
                              height: 150.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/salad.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Salad\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      handleToggle();
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: isExpanded ? 160.0 : 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/pizza.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Pizza\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/fries.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Fries\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/salad.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Salad\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/noodless.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Noodless\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/taco.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Taco\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 340.0,
                              height: 150.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/taco.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Taco\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/fries.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Fries\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      handleToggle();
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: isExpanded ? 160.0 : 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/pizza.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Pizza\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/fries.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Fries\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/noodless.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Noodless\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      width: 130.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/taco.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Taco\nRs. 100',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              // Add spacing between text and icon
                                              Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Color(0xfff9a825),
                                              ),
                                            ],
                                          ),
                                          // Adjust the spacing between the image and te
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const viewCart(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(14, 0, 20, 0),
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xfff9a825),
                              ),
                              child: Center(
                                child: Text(
                                  'View Cart',
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
