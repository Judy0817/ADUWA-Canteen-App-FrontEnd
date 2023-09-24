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
                  color: Color(0x8ed9d9d9),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 35.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.favorite),
                            title: Text('ListTile 3'),
                            subtitle: Text('Subtitle for ListTile 3'),
                            onTap: () {
                              print('ListTile 3 tapped!');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.favorite),
                            title: Text('ListTile 3'),
                            subtitle: Text('Subtitle for ListTile 3'),
                            onTap: () {
                              print('ListTile 3 tapped!');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.favorite),
                            title: Text('ListTile 3'),
                            subtitle: Text('Subtitle for ListTile 3'),
                            onTap: () {
                              print('ListTile 3 tapped!');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.favorite),
                            title: Text('ListTile 3'),
                            subtitle: Text('Subtitle for ListTile 3'),
                            onTap: () {
                              print('ListTile 3 tapped!');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.favorite),
                            title: Text('ListTile 3'),
                            subtitle: Text('Subtitle for ListTile 3'),
                            onTap: () {
                              print('ListTile 3 tapped!');
                            },
                          ),

                          SizedBox(height: 50,),


                        ],
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
