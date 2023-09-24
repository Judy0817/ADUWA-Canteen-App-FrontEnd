import 'package:flutter/material.dart';

Align SignInSignUpBtn(String text, Function() onTap) {
  return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xfff9a825),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ));
}

Align CanteenSet(String text, String imageName, Function() onTap) {
  return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(15),
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0xffffffff),
            ),
            child: Column(
              children: [
                Image.asset(
                  "images/$imageName",
                  width: 120,
                  height: 120,
                ), // Adjust the spacing between the image and text
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ],
            )),
      ));
}

Align FoodSet(String text, String imageName, Function() onTap) {
  return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffffffff),
            ),
            child: Column(
              children: [
                Image.asset(
                  "images/$imageName",
                  width: 80,
                  height: 80,
                ), // Adjust the spacing between the image and text
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ],
            )),
      ));
}

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
