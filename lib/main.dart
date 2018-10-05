import 'package:flutter/material.dart';

import './pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    // print('[main statelessWidget] build');
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}
