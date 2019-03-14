import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add project"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    );
  }
}