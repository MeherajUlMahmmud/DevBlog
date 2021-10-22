import 'package:DevBlog/screens/auth_screens/login_screen.dart';
import 'package:DevBlog/services/user_service.dart';
import 'package:DevBlog/utils/util_func.dart';
import 'package:DevBlog/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _name, _email, _password, _confirmPassword;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _registerUser() {
    _name = _nameController.text;
    _email = _emailController.text;
    _password = _passwordController.text;
    _confirmPassword = _confirmPasswordController.text;

    if (Validator.isValidName(_name) &&
        Validator.isValidEmail(_email) &&
        Validator.isValidPassword(_password) &&
        Validator.isValidConfirmPassword(_password, _confirmPassword)) {
      UserService().registerUser(_name, _email, _password).then((response) {
        if (response.isSuccessful) {
          UtilityFunction.showSnackbar(
              context, "Account creation successful", true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          UtilityFunction.showAlertDialog(
              context, "Error", response.message, false);
        }
      });
    } else if (!Validator.isValidName(_name)) {
      UtilityFunction.showSnackbar(
          context, 'Name must be at least 3 characters long', false);
    } else if (!Validator.isValidEmail(_email)) {
      UtilityFunction.showSnackbar(
          context, 'Please enter a valid email', false);
    } else if (!Validator.isValidPassword(_password)) {
      UtilityFunction.showSnackbar(
          context, 'Password must be at least 8 characters long', false);
    } else if (!Validator.isValidConfirmPassword(_password, _confirmPassword)) {
      UtilityFunction.showSnackbar(context, 'Passwords do not match', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
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
              keyboardType: TextInputType.name,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
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
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
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
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                onPressed: () {
                  _registerUser();
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
                    "Already a member?",
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
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
