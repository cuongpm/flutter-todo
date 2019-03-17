import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/bloc_provider.dart';
import 'package:flutter_todo/data/db/label_db.dart';
import 'package:flutter_todo/data/db/project_db.dart';
import 'package:flutter_todo/ui/about/about_us.dart';
import 'package:flutter_todo/ui/home/home_bloc.dart';
import 'package:flutter_todo/ui/label/label_bloc.dart';
import 'package:flutter_todo/ui/label/label_page.dart';
import 'package:flutter_todo/ui/project/project_bloc.dart';
import 'package:flutter_todo/ui/project/project_page.dart';
import 'package:flutter_todo/utils/app_constant.dart';

class SideDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Cuong Pham"),
            accountEmail: Text("minhcuong2910@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: NetworkImage(PROFILE_PICTURE)
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
          ),
          ListTile(
            title: Text("Inbox"),
            leading: Icon(Icons.inbox),
            onTap: () {
              homeBloc.updateTitle("Inbox");
              Navigator.pop(context);
            }
          ),
          ListTile(
            title: Text("Today"),
            leading: Icon(Icons.calendar_today),
            onTap: () {
              homeBloc.updateTitle("Today");
              Navigator.pop(context);
            }
          ),
          ListTile(
            title: Text("Next 7 days"),
            leading: Icon(Icons.calendar_today),
            onTap: () {
              homeBloc.updateTitle("Next 7 days");
              Navigator.pop(context);
            }
          ),
          BlocProvider(
            bloc: ProjectBloc(ProjectDB.get()),
            child: ProjectPage()
          ),
          BlocProvider(
            bloc: LabelBloc(LabelDB.get()),
            child: LabelPage()
          )
        ],
      )
    );
  }
}