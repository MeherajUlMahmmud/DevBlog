import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/main_screen.dart';
import 'package:flutter_mobile/screens/util_screens/change_password.dart';
import 'package:flutter_mobile/screens/util_screens/deactivate_account.dart';
import 'package:flutter_mobile/screens/util_screens/feedback.dart';
import 'package:flutter_mobile/utils/util_func.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _res;
  bool isLoading = false;
  bool isLoggedIn = false;

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
    });
    print(_res);

    if (_res != null) {
      setState(() {
        isLoading = false;
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoading = false;
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: <Widget>[
                  isLoggedIn
                      ? Column(
                          children: [
                            ListTile(
                              // change password
                              leading: Icon(Icons.lock),
                              title: Text('Change Password'),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen(),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.info),
                              title: Text('Deactivate Account'),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DeactivateAccountScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
    );
  }
}
