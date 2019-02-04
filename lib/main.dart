import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdg_goa/data.dart';
import 'package:gdg_goa/second_screen.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First Flight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fetch data from internet'),
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
  Future<List<Data>> fetchPost() async {
    List<Data> list = [];

    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      List decodedJson = json.decode(response.body);
      for (int i = 0; i < decodedJson.length; i++) {
        list.add(Data.fromJson(decodedJson[i]));
      }
      return list;
    } else {
      throw Exception("Failed..");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: FutureBuilder<List<Data>>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].title),
                  onTap: () {
                    //Use to navigate to new screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SecondScreen(
                            snapshot.data[index].title,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
