import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_ui/servises/string.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  static final String id = "";

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        actions: [
          (_selectedIndex != 2) ? TextButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
              controller.animateToPage(
                  _selectedIndex, duration: Duration(seconds: 2),
                  curve: Curves.easeInCubic);
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
          ) : TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomePage.id);
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              makePage(image: "assets/images/image_1.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(image: "assets/images/image_2.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(image: "assets/images/image_3.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          indicators(),
        ],
      ),
    );
  }

  Widget makePage({required String image, required title, required content}) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Column(
        children: [
          //#image
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                image,
                height: 250,
                width: 250,
              ),
            ),
          ),

          //#title #content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget elementOfIndixator(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 6),
      width: (index==_selectedIndex)? 25 : 6,
      height: 6,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(3)
      ),
    );

  }
  Widget indicators(){
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          elementOfIndixator(0),
          elementOfIndixator(1),
          elementOfIndixator(2),
        ],
      ),
    );
  }
}
