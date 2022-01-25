import 'package:flutter/material.dart';
import 'package:intro_ui/intro_page.dart';

import 'home_page.dart';
import 'intro_home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "intro UI",
      theme: ThemeData(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black
        )
      ),
      debugShowCheckedModeBanner: false,
      home: IntroHome(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
        IntroHome.id: (context) => IntroHome(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}





