import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First Flight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Infinite ListView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //TODO change it with ListView.builder()
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
          );
        },
      ),
    );
  }
}

///ListView Builder solution with Text()
/*

ListView.builder(
        itemBuilder: (context, index) {
          return Text(index.toString());
        },
      )

*/

///ListView Builder solution with ListTile()
/*

ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
          );
        },
      )

 */