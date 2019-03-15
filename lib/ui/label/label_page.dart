import 'package:flutter/material.dart';

class LabelPage extends StatelessWidget {
  final Widget child;

  LabelPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}