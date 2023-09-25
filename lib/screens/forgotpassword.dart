import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/signup.dart';
import '../../Reusable/reusable.dart';

import 'home.dart';
final double ffem = 45;
const double fem = 10.0;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          height: 60,
          width: 320.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _emailTextController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Color(0xfff9a825),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
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
                padding: EdgeInsets.all(15),
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
                    horizontal: 25.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 45),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Forgot \npassword",
                            style: TextStyle (
                              fontSize:  40,
                              fontWeight:  FontWeight.w700,
                              height: 1 ,
                              letterSpacing:  2,
                              color:  Color(0xffffffff),
                            ),),
                        ],
                      ),
                      SizedBox(height: 45),
                      buildEmail(),

                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                              width: 90.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xfff9a825),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xffffffff),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),





                      //buildRememberMe(),
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
