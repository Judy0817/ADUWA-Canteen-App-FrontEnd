import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/adminPage.dart';
import 'package:university_canteen/screens/signup.dart';
import '../../Reusable/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotpassword.dart';
import 'home.dart';
import 'location.dart';


final double ffem = 45;
const double fem = 10.0;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
        width: MediaQuery.of(context).size.height * 0.55,
        height: MediaQuery.of(context).size.height * 0.09,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.04,),
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

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          width: MediaQuery.of(context).size.height * 0.55,
          height: MediaQuery.of(context).size.height * 0.09,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.04,),
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

  Widget buildForogotPassBtn() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPassword()));
            },
            child: const Text(
              " Forgot Password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color(0xfff9a825),
                // Customize underline color
                decorationThickness: 2.0,
                color: Color(0xfff9a825),
                fontWeight: FontWeight.bold,
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
                    horizontal: MediaQuery.of(context).size.height * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.0775,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome \nBack !",
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      buildForogotPassBtn(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: const Text(
                                  " Sign Up",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xffffffff),
                                      // Customize underline color
                                      decorationThickness: 2.0,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                          ),
                          GestureDetector(
                            onTap: () async {
                              String email = _emailTextController.text;
                              String domain = email.substring(email.indexOf('@') + 1);
                              if (_passwordTextController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    errorMessage("Enter Your Password"));
                              } else if (_emailTextController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    errorMessage("Enter Your Email"));
                              }
                              try {
                                if (domain == 'foe.sjp.ac.lk') {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const location(),
                                    ),
                                  );
                                } else if (domain == 'admin.ac.lk') {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AdminPage(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      errorMessage(
                                          "No user found for that email."));
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      errorMessage(
                                          "No user found for that email."));
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      errorMessage(
                                          "Wrong password provided for that user."));
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xfff9a825),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xffffffff),
                                  size: MediaQuery.of(context).size.width * 0.1,
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
