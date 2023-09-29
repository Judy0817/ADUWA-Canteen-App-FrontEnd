
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Align SignInSignUpBtn(String text, Function() onTap) {
  return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: onTap,
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
      );
}

Align CanteenSet(String text, String imageName, Function() onTap) {
  return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(15),
            width: 135,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
                color: Color.fromRGBO(217, 217, 217, 0.5),
            ),
            child: Column(
              children: [
                Image.asset(
                  "images/$imageName",
                  width: 100,
                  height: 100,
                ), // Adjust the spacing between the image and text
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
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


SnackBar errorMessage(String msg) {
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text(
              "ERROR",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Text(
              msg,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
