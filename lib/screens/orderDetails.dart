import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({Key? key}) : super(key: key);

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Order Details",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          letterSpacing: 2,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Card(
                          color: Color.fromRGBO(217, 217, 217, 0.5),
                          margin: EdgeInsets.all(7),
                          child: ListTile(
                            title: Text(
                              'Food Name',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                            subtitle: Text(
                              'Price',
                              style: TextStyle(
                                  color: Color(0xfff9a825),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.03,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff9a825).withOpacity(0.5),
                                    ),
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.minimize,
                                          color: Color(0xffffffff),
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Text(
                                    '2',
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
                                        0.03,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xfff9a825),
                                    ),
                                    child: InkWell(
                                      onTap: (){

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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.50,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                              width: MediaQuery.of(context).size.height * 0.37,
                              height: MediaQuery.of(context).size.height * 0.21,
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
                                      Text(
                                        'Price',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ]),
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
                                        'Price',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total ',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Price',
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
                                                0.64,
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
