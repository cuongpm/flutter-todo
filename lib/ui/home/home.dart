import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/home/side_drawer.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today")
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        )
      ),
      drawer: SideDrawer()
    );
  }
}
