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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/first.png"),
                  fit: BoxFit.fill, // You can customize the fit as needed
                ),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.0375,
                  vertical: MediaQuery.of(context).size.height * 0.0475,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 1.8,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.height * 0.08,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xfff9a825).withOpacity(0.7),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
