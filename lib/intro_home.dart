import 'package:flutter/material.dart';
import 'package:intro_ui/servises/string.dart';

import 'home_page.dart';

class IntroHome extends StatefulWidget {
  static final String id = "";

  const IntroHome({Key? key}) : super(key: key);

  @override
  _IntroHomeState createState() => _IntroHomeState();
}

class _IntroHomeState extends State<IntroHome> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              makeApp(
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                  image: "assets/images/image_1.png"),
              makeApp(
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                  image: "assets/images/image_2.png"),
              makeApp(
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                  image: "assets/images/image_3.png"),
            ],
          ),
          indicators(),
          Align(
              alignment: Alignment(0.95, 0.9),
              child: Container(
                width: 50,
                height: 50,
                child: (currentIndex == 2)
                    ? TextButton(
                        child: Text("Skip",style: TextStyle(color: Colors.deepOrange),),
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                      )
                    : SizedBox.shrink(),
              ))
        ],
      ),
    );
  }

  Widget makeApp({title, content, image}) {
    return Container(
      padding: EdgeInsets.only(top: 35, right: 20, left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepOrange.shade700,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget getIndicator(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 6),
      width: (index == currentIndex) ? 20 : 6,
      height: 6,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget indicators() {
    return Container(
      padding: EdgeInsets.only(bottom: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIndicator(0),
          getIndicator(1),
          getIndicator(2),
        ],
      ),
    );
  }
}
