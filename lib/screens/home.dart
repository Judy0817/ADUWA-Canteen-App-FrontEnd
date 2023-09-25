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
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                )),
          ),
        ),
        SizedBox(width: 30,),
        GestureDetector(
          onTap: () {

          },
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
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 240,
                                child: Text("Find Your \nFavorite Food",
                                  style: TextStyle (
                                    fontSize:  30,
                                    height: 1 ,
                                    letterSpacing:  2,
                                    fontWeight: FontWeight.bold,
                                    color:  Color(0xffffffff),
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
                                fontSize:  16,
                                height: 1 ,
                                letterSpacing:  1,
                                fontWeight: FontWeight.bold,
                                color:  Color(0xffffffff),
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
