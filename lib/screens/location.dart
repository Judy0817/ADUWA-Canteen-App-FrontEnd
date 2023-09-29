import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/home.dart';
import 'package:university_canteen/screens/mapCurrentLocation.dart';
import 'map.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
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
                    horizontal: MediaQuery.of(context).size.height * 0.0375,
                    vertical: MediaQuery.of(context).size.height * 0.0475,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Set Your Location",
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
                        Text(
                          'Select University and current location here ! This data will be displayed in your profile for security perpose.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.height * 0.55,
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromRGBO(217, 217, 217, 0.5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 30,
                                    color: Color(0xfff9a825),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  Text(
                                    'Your university',
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Map()));
                                },
                                child: Container(
                                    margin: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.height * 0.45,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color.fromRGBO(217, 217, 217, 0.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Select University',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.height * 0.55,
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromRGBO(217, 217, 217, 0.5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.my_location,
                                    size: 30,
                                    color: Color(0xfff9a825),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  Text(
                                    'Current Location',
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MapCurrent()));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  width: MediaQuery.of(context).size.height * 0.45,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color.fromRGBO(217, 217, 217, 0.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Set Location',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Home(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(14, 0, 20, 0),
                                width: MediaQuery.of(context).size.height * 0.25,
                                height: MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Color(0xfff9a825),
                                ),
                                child: Center(
                                  child: Text(
                                    'SUBMIT',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
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
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
