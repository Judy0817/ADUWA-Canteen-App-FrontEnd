import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

final double ffem = 45;
const double fem = 10.0;
class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
            children: [
              Container(
                // autogroupbbd1p5M (4WZSuGvtXHwwbe373KbBd1)
                margin:  EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 40*fem),
                padding:  EdgeInsets.fromLTRB(94*fem, 355*fem, 94*fem, 0*fem),
                width:  double.infinity,
                height:  600*fem,
                decoration:  BoxDecoration (
                  image:  DecorationImage (
                    fit:  BoxFit.cover,
                    image:  AssetImage (
                        ("images/start_food.png")
                    ),
                  ),
                ),
                child:
                Align(
                  // undrawbreakfastpsiw1GT9 (10:16)
                  alignment:  Alignment.bottomCenter,
                  child:
                  SizedBox(
                    width:  311*fem,
                    height:  213*fem,
                    child:
                    Image.network(
                      ("images/start_food.png"),
                      width:  311*fem,
                      height:  213*fem,
                    ),
                  ),
                ),
              ),
              Container(
                // greattastegreatflavoursC3 (10:133)
                margin:  EdgeInsets.fromLTRB(10*fem,31*fem, 0*fem, 20*fem),
                constraints:  BoxConstraints (
                  maxWidth:  500,
                ),
                child:
                Text(
                  'Great Taste , Great\n Flavour',
                  textAlign:  TextAlign.center,
                  style:  TextStyle (
                    fontSize:  20,
                    fontWeight:  FontWeight.w700,
                    height: 1 ,
                    letterSpacing:  2,
                    color:  Color(0xfff9a825),
                  ),
                ),
              ),
              Container(
                // backgrounddraftpixelhandsharee (10:139)
                margin:  EdgeInsets.fromLTRB(6*fem,40*fem, 0*fem, 10*fem),
                constraints:  BoxConstraints (
                  maxWidth:  300,
                ),
                child:
                Text(
                  'Background draft pixel hand share editor outline rotate. Selection variant variant editor plugin.',
                  textAlign:  TextAlign.center,
                  style:  TextStyle (
                    fontSize:  13,
                    fontWeight:  FontWeight.w400,
                    height:  1,
                    letterSpacing:  1,
                    color:  Color(0xff000000),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin:  EdgeInsets.fromLTRB(0*fem,56*fem, 0*fem, 0*fem),
                  width: 350.0,
                  height: 50.0,  // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xfff9a825),
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xfff9a825),
                    ),

                    child:  Text(
                      'GET STARTED',
                      textAlign:  TextAlign.center,
                      style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),

                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
