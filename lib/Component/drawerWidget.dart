import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
          child: Text("Menu"), decoration: BoxDecoration(color: Colors.blue)),
      ListTile(
          title: Text("Business Request"),
          onTap: () {
            Navigator.pop(context);
          }),
      ListTile(
          title: Text("Logout"),
          onTap: () {
            Navigator.pop(context);
          })
    ]));
  }
}
