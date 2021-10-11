import 'package:DevBlog/screens/main_screen.dart';
import 'package:DevBlog/screens/util_screens/feedback.dart';
import 'package:DevBlog/screens/util_screens/settings.dart';
import 'package:DevBlog/widgets/drawer_user_controller.dart';
import 'package:DevBlog/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class NavigationMainScreen extends StatefulWidget {
  @override
  _NavigationMainScreenState createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = MainScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = MainScreen();
        });
      }
      // else if (drawerIndex == DrawerIndex.Help) {
      //   setState(() {
      //     screenView = HelpScreen();
      //   });
      // }
      else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Settings) {
        setState(() {
          screenView = SettingsScreen();
        });
      }
      // else if (drawerIndex == DrawerIndex.Invite) {
      //   setState(() {
      //     screenView = InviteFriend();
      //   });
      // }
      else {
        //do in your way......
      }
    }
  }
}
