import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Welcome to HomePage"
        ),
      ),
    );
  }
}
