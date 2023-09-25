import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class viewCart extends StatefulWidget {
  const viewCart({Key? key}) : super(key: key);

  @override
  State<viewCart> createState() => _viewCartState();
}

class _viewCartState extends State<viewCart> {
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
                    horizontal: 25.0,
                    vertical: 35.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Order Details",
                            style: TextStyle (
                              fontSize:  40,
                              fontWeight:  FontWeight.w700,
                              height: 1 ,
                              letterSpacing:  2,
                              color:  Color(0xffffffff),
                            ),),
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
