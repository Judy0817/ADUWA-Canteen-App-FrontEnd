import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Reusable/reusable.dart';

import 'home.dart';
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
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xfff9a825),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
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
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.circular(50),
              ),
          height: 50,
          width: 350.0,
          child: TextField(
            controller: _passwordTextController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xfff9a825),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildForogotPassBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Home()));
            },
            child: const Text(
              " Forgot Password?",
              style: TextStyle(
                color: Color(0xfff9a825),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
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
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x8ed9d9d9),
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
                          Text("Welcome to back",
                            style: TextStyle (
                              fontSize:  15,
                              fontWeight:  FontWeight.w700,
                              height: 1 ,
                              letterSpacing:  2,
                              color:  Color(0xff000000),
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text("Background draft pixel hand share editor outline rotate. Selection variant variant editor plugin",
                              style: TextStyle (
                                fontSize:  13,
                                height: 1 ,
                                letterSpacing:  2,
                                color:  Color(0xff000000),
                              ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 45),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 35),
                      SignInSignUpBtn("Login", () async {
                        // if (_passwordTextController.text == "") {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       errorMessage("Enter Your Password"));
                        // } else if (_emailTextController.text == "") {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(errorMessage("Enter Your Email"));
                        // }
                        // try {
                        //   final credential = await FirebaseAuth.instance
                        //       .signInWithEmailAndPassword(
                        //     email: _emailTextController.text,
                        //     password: _passwordTextController.text,
                        //   );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'user-not-found') {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         errorMessage("No user found for that email."));
                        //   } else if (e.code == 'wrong-password') {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         errorMessage("Wrong password provided for that user."));
                        //   }
                        // }
                      }),
                      SizedBox(height: 30),
                      buildForogotPassBtn(),
                      SizedBox(height: 40),
                      Text("Don't have an account?",
                        style: TextStyle(
                          color: Color(0xff000000),

                        ),),
                      SizedBox(height: 15),
                      SignInSignUpBtn("Create an Account", () async {
                        // if (_passwordTextController.text == "") {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       errorMessage("Enter Your Password"));
                        // } else if (_emailTextController.text == "") {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(errorMessage("Enter Your Email"));
                        // }
                        // try {
                        //   final credential = await FirebaseAuth.instance
                        //       .signInWithEmailAndPassword(
                        //     email: _emailTextController.text,
                        //     password: _passwordTextController.text,
                        //   );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'user-not-found') {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         errorMessage("No user found for that email."));
                        //   } else if (e.code == 'wrong-password') {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         errorMessage("Wrong password provided for that user."));
                        //   }
                        // }
                      }),


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
