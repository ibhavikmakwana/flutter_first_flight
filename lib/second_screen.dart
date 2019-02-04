import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String data;

  SecondScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second screen"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Text(
            data,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
