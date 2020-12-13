import 'package:flutter/material.dart';
import 'package:where_am_i/screen/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchStation(title: 'Search Station'),
    );
  }
}
