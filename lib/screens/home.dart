import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/Reusable/reusable.dart';

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
                hintText: 'Which canteen do you want?',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
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
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Row(
                            crossAxisAlignment:  CrossAxisAlignment.center,
                            children:  [
                              Container(
                                // hellojudyxYX (66:222)
                                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                                child:
                                Text(
                                  'Hello, Judy',
                                  style:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Container(
                                // ellipse234B (66:223)
                                width:  50,
                                height:  50,
                                decoration:  BoxDecoration (
                                  borderRadius:  BorderRadius.circular(23.5*fem),
                                  color: Color(0x93d9d9d9),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text("Find Your Favorite Food",
                                  style: TextStyle (
                                    fontSize:  20,
                                    height: 1 ,
                                    letterSpacing:  2,
                                    fontWeight: FontWeight.bold,
                                    color:  Color(0xff000000),
                                  ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          SearchBar(),
                          SizedBox(height: 25,),
                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text("Popular Canteen",
                              style: TextStyle (
                                fontSize:  15,
                                height: 1 ,
                                letterSpacing:  2,
                                fontWeight: FontWeight.bold,
                                color:  Color(0xff000000),
                              ),),
                          ),
                        ],
                      ),
                          SizedBox(height: 25,),
                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CanteenSet("Open Canteen","noodless.png", () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OpenCanteen(),
                              ),
                            );
                          }),
                          CanteenSet("Gym Canteen","salad.png", () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OpenCanteen(),
                              ),
                            );
                          }),
                        ],
                      ),
                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CanteenSet("Rahula Canteen","fries.png", () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OpenCanteen(),
                              ),
                            );
                          }),
                          CanteenSet("Green Canteen","taco.png", () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OpenCanteen(),
                              ),
                            );
                          }),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
