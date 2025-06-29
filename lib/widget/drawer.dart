import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Home Screen"),
            leading: Icon(
              Icons.home_filled,
              color: Colors.amber,
            ),
            onTap: () => Navigator.popAndPushNamed(context, "/"),
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(
              Icons.account_circle_rounded,
              color: Colors.amber,
            ),
            onTap: () => Navigator.popAndPushNamed(context, "/about"),
          )
        ],
      ),
    );
  }
}
