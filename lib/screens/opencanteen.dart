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
          width: MediaQuery.of(context).size.width * 0.06,
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
                    vertical: MediaQuery.of(context).size.height * 0.0775,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      SearchBar(),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "Popular Foods - Open Canteen",
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
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
                                          height: MediaQuery.of(context).size.height * 0.08,
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
                                          width: MediaQuery.of(context).size.width * 0.03,
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
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width * 0.1,// Set the width as needed
                                      height: MediaQuery.of(context).size.height * 0.06,// Set the height as needed
                                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xfff9a825).withOpacity(0.7),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.0775,
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
