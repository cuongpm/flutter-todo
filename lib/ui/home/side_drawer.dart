import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/about/about_us.dart';

class SideDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Cuong Pham"),
            accountEmail: Text("minhcuong2910@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: NetworkImage("https://avatars3.githubusercontent.com/u/2792438?s=400&u=15ee750219a917a7dfd4b9f0cd31f49f15a8793e")
            ),
            otherAccountsPictures: <Widget>[
             IconButton(
               icon: Icon(
                 Icons.info,
                color: Colors.white,
                size: 36.0,
               ),
               onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => AboutUsPage()));
               },
             )
            ]
          )
        ],
      )
    );
  }

}