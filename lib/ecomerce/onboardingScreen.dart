import 'package:flutter/material.dart';
import 'package:task1/ecomerce/Categories.dart';
import 'package:task1/ecomerce/onboardingScreen.dart';

class Carsoule extends StatefulWidget {
  const Carsoule({super.key});

  @override
  State<Carsoule> createState() => _CarsouleState();
}

class _CarsouleState extends State<Carsoule> {
  List<String> images = [
    "lib/images/category1.jpg",
    "lib/images/category9.jpg",
    "lib/images/category3.jpg",
    // "lib/images/category2.jpg",
  ];
  int activePage = 1;
  // late PageController _pageController;
  final _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController(viewportFraction: 0.8);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 550,
            child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return ListView(
                  children: [
                    Container(
                      height: 250,
                      width: 500,
                      margin: EdgeInsets.all(5),
                      // padding: EdgeInsets.all(20),
                      child: Image.asset(images[pagePosition]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextWidget(
                          title: title[pagePosition],
                          subTitle: subTitle[pagePosition]),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(images.length, activePage)),
          SizedBox(
            height: 70,
          ),
          Container(
            width: 200,
            height: 50,
            // color: Colors.blueAccent,

            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Categories()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 19, 84, 174))
              // ButtonStyle(
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(18.0),
              //           side: BorderSide(
              //               color: const Color.fromARGB(255, 244, 240, 240)))),
              // )
              // maximumSize: Size(0, 10)
              ,
              label: Text("Get Started"),
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.rectangle),
      );
    });
  }

  List<String> title = [
    "Your Holiday Shopping Delivered To Your Home ",
    "Hello To Our Market Wish you interest",
    "EveryThing You Need, are Available In Our Market"
  ];

  List<String> subTitle = [
    "there's something for everyone to enjoy with sweet shop features",
    "We Have Toys, Choclate For kids",
    "We Have Fresh Vegetables, Fruits, Meats, Fishes"
  ];

  // Homes(imagesLength,currentIndex){
  //   return TextWidget(title: title[currentIndex], subTitle: subTitle[currentIndex])
  // }
}

class TextWidget extends StatelessWidget {
  String title;

  String subTitle;

  TextWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          subTitle,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
