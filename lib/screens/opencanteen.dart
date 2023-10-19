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

  bool isExpanded = false;

  void handleToggle() {
    setState(() {
      isExpanded = !isExpanded; // Toggle the state
    });
  }
  List<Map<String, dynamic>> dataList = [];
  bool _isloading =true;

  String baseUrl = 'http://192.168.211.221:9090';
  String? getFoodName(int index) {
    if (index >= 0 && index < dataList.length) {
      return dataList[index]['food_name'] as String?;
    }
    return null;
  }

  double? getPrice(int index) {
    if (index >= 0 && index < dataList.length) {
      return dataList[index]['price'] as double?;
    }
    return null;
  }

  String? getDescription(int index) {
    if (index >= 0 && index < dataList.length) {
      return dataList[index]['description'] as String?;
    }
    return null;
  }

  // Future<void> insertOrder() async {
  //   final apiUrl = Uri.parse("$baseUrl/insert_bucket");
  //
  //   try {
  //     Map<String, String> data = {
  //       'FoodName': dataList[index]['name'],
  //       'Price': dataList[index]['price'].toString(),
  //       // Add other data fields as needed
  //     };
  //
  //     Uri uri = Uri.https('', url, data); // Create a Uri with the data as query parameters
  //
  //     final response = await http.get(uri);
  //
  //     if (response.statusCode == 200) {
  //       print("Record inserted successfully!");
  //       // Refresh the list view after insertion
  //       //retrieveData();
  //     } else {
  //       throw Exception('Failed to insert record');
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
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
  // Future<void> addToCart(double price) async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/add_to_cart?price=$price'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     }, // Replace with your item's price
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print('Item added to cart successfully');
  //   } else {
  //     print('Failed to add item to cart. Error ${response.statusCode}');
  //   }
  // }
  // Future<void> getTotalPrice() async {
  //   final response = await http.get(Uri.parse('$baseUrl/get_total_price'));
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print('Total Price: ${data['total_price']}');
  //   } else {
  //     print('Failed to get total price. Error ${response.statusCode}');
  //   }
  // }

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
  void initState() {
    super.initState();
    retrieveData();
    _refreshRecord();
  }

  // Future<String> getCurrentUserEmail() async {
  //   final response = await http.get('YOUR_SERVER_ENDPOINT_HERE');
  //
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return data['email'];
  //   } else {
  //     throw Exception('Failed to load user email');
  //   }
  // }

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
                                                Text(dataList[index]['price'].toString(),
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
                                              // Define the URL of your Python backend
                                              String url = 'http://192.168.211.221:9090/insert_bucket';
                                              Map<String, String> data = {
                                                'FoodName': dataList[index]['name'],
                                                'Price': dataList[index]['price'].toString(),
                                                // Add other data fields as needed
                                              };

                                              Uri uri = Uri.https('', url, data); // Create a Uri with the data as query parameters

                                              final response = await http.get(uri);

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