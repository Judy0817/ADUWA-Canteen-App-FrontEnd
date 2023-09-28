import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university_canteen/screens/location.dart';
import 'package:university_canteen/screens/start.dart';
import '../Reusable/reusable.dart';
import 'adminPage.dart';
import 'home.dart';

final double ffem = 45;
const double fem = 10.0;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

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
                    Icons.email,
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

  Widget buildUserName() {
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
              controller: _userNameTextController,
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
                  hintText: 'User name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
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
              controller: _passwordTextController,
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  suffixIcon: Icon(
                    Icons.key_outlined,
                    color: Color(0xfff9a825),
                  ),
                  hintText: 'Password',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              letterSpacing: 2,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 45),
                      buildUserName(),
                      SizedBox(height: 20),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              String email = _emailTextController.text;
                              String userName = _userNameTextController.text;
                              String domain= email.substring(email.indexOf('@')+1);

                              if (_userNameTextController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    errorMessage("Enter Your User Name"));
                              } else if (_emailTextController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    errorMessage("Enter Your Email"));
                              } else if (_passwordTextController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    errorMessage("Enter Your Password"));
                              } else {
                                try {
                                  if(domain=='foe.sjp.ac.lk'){
                                    UserCredential userCredential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text);
                                    User? user = FirebaseAuth.instance.currentUser;


                                    if (user != null && !user.emailVerified) {
                                      await user.sendEmailVerification();
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const location(
                                          ),
                                        ));
                                  }else if(domain=='admin.ac.lk'){
                                    UserCredential userCredential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text);
                                    User? user = FirebaseAuth.instance.currentUser;


                                    if (user != null && !user.emailVerified) {
                                      await user.sendEmailVerification();
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const AdminPage(
                                          ),
                                        ));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        errorMessage("User Registration Failed"));
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        errorMessage(
                                            "Password must be at least 6 characters"));
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        errorMessage(
                                            "Account already exists for that email"));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      errorMessage("User Registration Failed"));
                                }
                              }
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
