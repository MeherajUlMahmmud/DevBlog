import 'package:DevBlog/screens/auth_screens/signup_screen.dart';
import 'package:DevBlog/screens/navigation_main_screen.dart';
import 'package:DevBlog/services/user_service.dart';
import 'package:DevBlog/utils/util_func.dart';
import 'package:DevBlog/utils/validators.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;

    // if (Validator.isValidEmail(_email) &&
    //     Validator.isValidPassword(_password)) {
    // UserService().loginUser(_email, _password).then((response) {
    //   if (response.isSuccessful) {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => NavigationMainScreen()));
    //   } else {
    //     UtilityFunction.showAlertDialog(
    //         context, "Error", response.message, false);
    //   }
    // });
    // } else if (!Validator.isValidEmail(_email)) {
    //   UtilityFunction.showSnackbar(context, "Enter a valid Email", false);
    // } else if (!Validator.isValidPassword(_password)) {
    //   UtilityFunction.showSnackbar(
    //       context, "Password must be at least 8 characters long", false);
    // } else {
    //   UtilityFunction.showSnackbar(
    //       context, "Enter a valid Email and Password", false);
    // }

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => NavigationMainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              height: 80,
              width: 60,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                onPressed: () {
                  _loginUser();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New to DevBlog?",
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
