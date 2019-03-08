import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Cuong Pham"),
            accountEmail: Text("minhcuong2910@gmail.com")
          )
        ],
      )
    );
  }

}