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