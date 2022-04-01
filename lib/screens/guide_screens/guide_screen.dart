import 'package:flutter/material.dart';
import 'package:kbsg/components/guide_message.dart';
import 'package:kbsg/constants/constants.dart';

import 'welcome_screen.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  final Constants _constants = Constants();
  PageController? _pageController;
  int currentIndex = 0;

  List guideData = [
    [
      "Easly Check Your Fee",
      "You don't have to go far to find your fee details just use this app.",
      "assets/images/illustrations/02.jpg"
    ],
    [
      "Easly get notified",
      "Now eat well, don't leave the house,You can choose your favorite food only with one click",
      "assets/images/illustrations/03.jpg"
    ],
    [
      "Get updated with events",
      "You can eat at expensive restaurants with affordable price",
      "assets/images/illustrations/01.jpg"
    ]
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _constants.sidePadding, vertical: 16),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            _pageSlider(),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _pageSlider() {
    return Expanded(
      child: PageView.builder(
        reverse: false,
        scrollDirection: Axis.horizontal,
        itemCount: guideData.length,
        controller: _pageController,
        onPageChanged: (value) => {
          setState(() {
            currentIndex = value;
          })
        },
        itemBuilder: (context, index) {
          return GuideMessage(
            title: guideData[index][0],
            description: guideData[index][1],
            imageUrl: guideData[index][2],
          );
        },
      ),
    );
  }

  Widget _bottomBar() {
    return SizedBox(
      child: Row(
        children: [
          Expanded(flex: 1, child: _skipBtn(currentIndex)),
          Expanded(flex: 4, child: _slideIden(currentIndex)),
          Expanded(flex: 1, child: _guideButton()),
        ],
      ),
    );
  }

  Widget _skipBtn(int index) {
    return (index != 2)
        ? TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        : Text(
            "    ",
            style: Theme.of(context).textTheme.headline5,
          );
  }

  Widget _slideIden(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(index == 0),
        _dot(index == 1),
        _dot(index == 2),
      ],
    );
  }

  Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 10,
      width: active ? 15 : 10,
      decoration: BoxDecoration(
        color: active ? Theme.of(context).primaryColor : Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _guideButton() {
    return (currentIndex == 2)
        ? TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            child: Text(
              "Next",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          )
        : IconButton(
            onPressed: () {
              _pageController!.animateToPage(currentIndex + 1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn);
            },
            icon: Icon(Icons.arrow_right_alt_rounded,
                color: Theme.of(context).primaryColor),
          );
  }
}
