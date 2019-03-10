import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  final Widget child;

  ProjectPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}