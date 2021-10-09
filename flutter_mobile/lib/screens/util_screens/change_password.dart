import 'package:flutter/material.dart';
import 'package:flutter_mobile/utils/util_func.dart';
import 'package:flutter_mobile/utils/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String _res;
  bool isLoading = false;

  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    setState(() {
      isLoading = true;
    });
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _res = prefs.getString("token");
      isLoading = false;
    });
    print(_res);
  }

  Future<void> _changePassword(oldPassword, newPassword, token) async {
    // await UserService.updatePassword(oldPassword, newPassword, token)
    //     .then((value) {
    //   if (value) {
    //     setState(() {
    //       isLoading = false;
    //     });
    //     UtilityFunction.clearSharedPreferences(context);
    //     UtilityFunction.showAlertDialog(
    //         context, "Success", "Password changed successfully", true);
    //   } else {
    //     setState(() {
    //       isLoading = false;
    //     });
    //     UtilityFunction.showAlertDialog(
    //         context, "Error", "Something went wrong", false);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Theme(
                child: TextFormField(
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _oldPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    labelText: "Old Password",
                    labelStyle: TextStyle(),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Theme.of(context).accentColor,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Theme(
                child: TextFormField(
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    labelText: "New Password",
                    labelStyle: TextStyle(),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Theme.of(context).accentColor,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Theme(
                child: TextFormField(
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    labelText: "Confirm New Password",
                    labelStyle: TextStyle(),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Theme.of(context).accentColor,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: 50.0,
              child: ElevatedButton(
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (Validator.isValidPassword(_oldPasswordController.text) &&
                      Validator.isValidPassword(_newPasswordController.text) &&
                      Validator.isValidPassword(
                          _confirmPasswordController.text) &&
                      Validator.isValidConfirmPassword(
                          _confirmPasswordController.text,
                          _newPasswordController.text)) {
                    _changePassword(_oldPasswordController.text,
                        _newPasswordController.text, _res);
                  } else if (!Validator.isValidPassword(
                      _oldPasswordController.text)) {
                    UtilityFunction.showAlertDialog(context, "Error",
                        "Password must be at least 8 characters long", false);
                  } else if (!Validator.isValidPassword(
                      _newPasswordController.text)) {
                    UtilityFunction.showAlertDialog(context, "Error",
                        "Password must be at least 8 characters long", false);
                  } else if (!Validator.isValidPassword(
                      _confirmPasswordController.text)) {
                    UtilityFunction.showAlertDialog(context, "Error",
                        "Password must be at least 8 characters long", false);
                  } else if (!Validator.isValidConfirmPassword(
                      _newPasswordController.text,
                      _confirmPasswordController.text)) {
                    UtilityFunction.showAlertDialog(
                        context, "Error", "Passwords do not match", false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
