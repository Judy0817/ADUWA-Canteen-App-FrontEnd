import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({Key? key}) : super(key: key);

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {

  //String baseUrl = 'http://10.34.26.42:9090';
  String baseUrl = 'http://192.168.250.221:9090';
  List<Map<String, dynamic>> dataList = [];
  bool _isloading =true;

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
  Future<void> deleteRecord(int id) async {
    final int recordIdToDelete = id; // Replace with the ID of the record you want to delete

    final response = await http.get(
      Uri.parse('$baseUrl/delete_bucket/$recordIdToDelete'), // Replace with your server's URL
    );

    if (response.statusCode == 200) {
      print('Order deleted successfully');
      _refreshRecord();
    } else if (response.statusCode == 404) {
      print('Order not found');
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  Future<void> _refreshRecord() async {
    String? userName = await getUserName();
    final data = await retrieveData(userName);
    setState(() {
      // dataList = data;
      _isloading = false;
    });
  }

  Future<void> retrieveData(String? username) async {

    final String url = '$baseUrl/retrieve_bucket?Username=$username';
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
  double totalPrice=0;
  String error = '';

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

  Map<String, int> foodQuantity = {};
  void increaseValue(String foodName) {
    setState(() {
      if (foodQuantity.containsKey(foodName)) {
        foodQuantity[foodName] = (foodQuantity[foodName] ?? 0).toInt() + 1;

      } else {
        foodQuantity[foodName] = 1; // Initialize quantity to 1 if it doesn't exist
      }
    });
  }

  void decreaseValue(String foodName) {
    setState(() {
      if (foodQuantity.containsKey(foodName) && (foodQuantity[foodName] ?? 0).toInt() > 1) {
        foodQuantity[foodName] = (foodQuantity[foodName] ?? 0).toInt() - 1;

      } else {
        foodQuantity.remove(foodName); // Remove the food item if quantity is 1 or less
      }
    });
  }
  double calculateSubtotal(int quantity, double price) {
    double subtotal =  quantity * price;
    return subtotal;
  }

  double? getQuantity(int index) {
    if (index >= 0 && index < dataList.length) {
      return dataList[index]['Quantity'] as double?;
    }
    return null;
  }

  Future<void> updateRecord(int id,int Quantity, double SubTotal) async {

    final int recordIdToDelete = id;

    if (id == 0 || Quantity==0 || SubTotal==0) {
      // Validation: Check if fields are not empty and ID is valid.
      print('Please enter valid data.');
      return;
    }
    final Uri url = Uri.parse('$baseUrl/update_bucket/$recordIdToDelete');
    final response = await http.get(
      Uri.parse(
          '$url?Quantity=${Quantity}&SubTotal=${SubTotal}'),
    );

    if (response.statusCode == 200) {
      print('Record updated successfully');
      _refreshRecord();
    } else if (response.statusCode == 404) {
      print('Not Updated');
    } else {
      print('Error: ${response.statusCode}');
    }
  }


  Future<void> fetchData() async {
    String? userName = await getUserName();
    await retrieveData(userName); // Wait for retrieveData to complete before moving to fetchTotalPrice
    await fetchTotalPrice(); // Wait for fetchTotalPrice to complete
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call a combined function to retrieve data and fetch total price
  }
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
                    vertical: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Order Details",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.06,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: ListView.builder(
                            itemCount: dataList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.1,),
                                  ),
                                  child: Card(
                                    color: Color.fromRGBO(217, 217, 217, 0.5),
                                    child: ListTile(
                                      title: Text(dataList[index]['FoodName'],style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffffff),
                                      ),),
                                      subtitle: Text(
                                        'Rs. ' + dataList[index]['Price'].toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xfff9a825),
                                          fontWeight: FontWeight.bold
                                        ),),
                                      trailing: SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Container(
                                              width: MediaQuery.of(context).size.height *
                                                  0.04,
                                              height: MediaQuery.of(context).size.height *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Color(0xfff9a825).withOpacity(0.5),
                                              ),
                                              child: InkWell(
                                                onTap: (){
                                                  decreaseValue(dataList[index]['FoodName']);
                                                  String foodName = dataList[index]['FoodName'].toString();
                                                  double price = double.tryParse(dataList[index]['Price']) ?? 0.0;
                                                  int quantity = foodQuantity[dataList[index]['FoodName']] ?? 1;
                                                  int id = dataList[index]['OrderID'];


                                                  double subtotalValue = calculateSubtotal(quantity, price);

                                                  updateRecord(id, quantity, subtotalValue);
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Icons.minimize,
                                                    color: Color(0xffffffff),
                                                    size: MediaQuery.of(context).size.height * 0.04,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width *
                                                  0.03,
                                            ),
                                            Text(
                                              '${foodQuantity[dataList[index]['FoodName']] ?? 1}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width *
                                                  0.03,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.height *
                                                  0.04,
                                              height: MediaQuery.of(context).size.height *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Color(0xfff9a825),
                                              ),
                                              child: InkWell(
                                                onTap: (){
                                                  increaseValue(dataList[index]['FoodName']);
                                                  String foodName = dataList[index]['FoodName'].toString();
                                                  double price = double.tryParse(dataList[index]['Price']) ?? 0.0;
                                                  int quantity = foodQuantity[dataList[index]['FoodName']] ?? 1;
                                                  int id = dataList[index]['OrderID'];


                                                  double subtotalValue = calculateSubtotal(quantity, price);

                                                  updateRecord(id, quantity, subtotalValue);
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color(0xffffffff),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width *
                                                  0.01,
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.delete, color: Color(0xfff9a825),),
                                                  onPressed: () {
                                                    deleteRecord(dataList[index]['OrderID']);
                                                  },

                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        )
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              padding: EdgeInsets.fromLTRB(10, 15, 20, 5),
                              width: MediaQuery.of(context).size.width * 0.77,
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xfff9a825),
                              ),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sub Total',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Spacer(),
                                    FutureBuilder<double>(
                                      future: fetchTotalPrice(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return CircularProgressIndicator(); // Show a loading indicator while waiting for the result.
                                        } else if (snapshot.hasError) {
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
                                            'Rs. ' + totalPrice.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          );
                                        }
                                      },
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.02,
                                ),


                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Extra Cost',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Rs. 50.0',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Home(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(14, 0, 20, 0),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.60,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Place Order',
                                            style: const TextStyle(
                                              color: Color(0xfff9a825),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
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
