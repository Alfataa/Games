import 'package:flutter/material.dart';

import '../model/User.dart';
import '../view/home/home.dart';
import '../view/profile/profile.dart';

class DrawerWidget extends StatefulWidget {
  int user;

  DrawerWidget({Key? key, required this.user}) : super(key: key);
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(user: widget.user)))),
          _drawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                            user: widget.user,
                          )))),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage("assets/images/Profile/eisa.png"),
          fit: BoxFit.cover),
    ),
    accountName: Text('Adam Badruzzaman'),
    accountEmail: Text('adambadruzs@gmail.com'),
  );
}

Widget _drawerItem(
    {IconData? icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
