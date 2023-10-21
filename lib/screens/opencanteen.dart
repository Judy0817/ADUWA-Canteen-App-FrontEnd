import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/food_descrip.dart';
import 'package:university_canteen/screens/orderDetails.dart';
import '../Reusable/reusable.dart';
import 'adminPage.dart';
import 'foodDataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load user name');
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
    retrieveData();
    _refreshRecord();
  }

  bool isExpanded = false;
  String apiUrl = 'http://192.168.211.221:9090/insert_bucket';

  void handleToggle() {
    setState(() {
      isExpanded = !isExpanded; // Toggle the state
    });
  }
  List<Map<String, dynamic>> dataList = [];
  bool _isloading =true;
  //String baseUrl = 'http://10.34.26.42:9090';
  String baseUrl = 'http://192.168.211.221:9090';

  Future<void> addToCart(String? username,String foodName, double price) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$apiUrl?Username=${username}&FoodName=${foodName}&Price=${price}&Quantity=1&SubTotal=${price}'),
      );

      if (response.statusCode == 200) {
        // Request was successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Added to cart')),
        );
      } else {
        // Request failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add to cart')),
        );
      }
    } catch (error) {
      // Handle network or request errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  Future<void> retrieveData() async {
    final String url = '$baseUrl/retrieve_food';
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
  Future<void> _refreshRecord() async {
    final data = await retrieveData();
    setState(() {
      // dataList = data;
      _isloading = false;
    });
  }

  static List images = [
    "images/parata.jpg",
    "images/uludu.jpg",
    "images/thosa.jpg",
    "images/rice.jpg",
    "images/kottu.jpg",
    "images/noodle.jpeg",
    "images/rolls.jpg",
    "images/sandwidtch.jpg",
    "images/hoppers.jpg",
    "images/omletBun.jpg",
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SearchBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),

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
                          itemCount: dataList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.005,
                                ),
                                child: Card(
                                  elevation: 5,
                                  color: Color.fromRGBO(217, 217, 217, 0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: MediaQuery.of(context).size.height *0.0175,
                                      vertical: MediaQuery.of(context).size.height *0.0175,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context).size.width * 0.2,
                                                height: MediaQuery.of(context).size.height * 0.08,
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => FoodDesc(
                                                          id: dataList[index]['id'],
                                                          name: dataList[index]['name'],
                                                          description: dataList[index]['description'],
                                                          price: dataList[index]['price'],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                      images[index],
                                                    ),
                                                    backgroundColor: Colors.transparent, // Replace with your asset path
                                                  ),
                                                ),
                                              ),

                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(dataList[index]['name'],style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffffffff),
                                                ),),
                                                Text('Rs. ' + dataList[index]['price'].toString(),
                                                  style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xffffffff),
                                                ),),
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          width: 40,
                                          // Set the width as needed
                                          height: 40,
                                          // Set the height as needed
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color:
                                            Color(0xfff9a825).withOpacity(0.7),
                                          ),
                                          child: TextButton(
                                            onPressed: () async {

                                              addToCart(USERName,dataList[index]['name'],  dataList[index]['price']);
                                            },
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          )

                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context){
                                    return const orderDetails();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(14, 0, 20, 0),
                              width: MediaQuery.of(context).size.width * 0.30,
                              height:
                              MediaQuery.of(context).size.height * 0.0775,
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
                      ),
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