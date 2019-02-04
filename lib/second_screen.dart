import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String index;

  SecondScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second screen"),
      ),
      body: Center(
        child: Container(
          child: Text(
            index,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
