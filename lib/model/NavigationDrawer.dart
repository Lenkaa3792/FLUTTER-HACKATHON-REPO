import 'package:flutter/material.dart';
import 'package:todolist/constants/Colours.dart';
import 'package:todolist/constants/Textstyle.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: tdAbColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Gucha Duncan"),
            accountEmail: Text("gucha_duncan@outlook.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/profile.png"),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: Icon(Icons.home, color: whiteColor),
            title: Text("Home", style: drawerFont),
            onTap: () {
              print("Home Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.done, color: whiteColor),
            title: Text("Completed Task", style: drawerFont),
            onTap: () {
              print("Completed Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.pending, color: whiteColor),
            title: Text("Pending Task", style: drawerFont),
            onTap: () {
              print("Pending Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.call, color: whiteColor),
            title: Text("Report Problem", style: drawerFont),
            onTap: () {
              print("Call Clicked");
            },
          ),
        ],
      ),
    );
  }
}
