import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kbsg/bloc/nav_controller/active_nav.dart';
import 'package:kbsg/screens/main_screens/home_screen.dart';
import 'package:kbsg/screens/main_screens/notification_screen.dart';
import 'package:kbsg/screens/main_screens_controller/components.dart/bottom_nav.dart';

import '../main_screens/recommend_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int currentState = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // _stateListener();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActiveNav(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            (currentState == 0)
                ? "Profile"
                : ((currentState == 1) ? "Notification" : "Recommendations"),
            style: const TextStyle(
              color: Color(0xFF1F2937),
            ),
          ),
          elevation: 1,
        ),
        endDrawer: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              _manageAccounts(),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(),
        body: _mainScreensView(),
      ),
    );
  }

  Widget _manageAccounts() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Manage Accounts",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget _mainScreensView() {
    return BlocConsumer<ActiveNav, int>(
      builder: (context, state) {
        return PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: const [
            HomeScreen(),
            NotifyScreen(),
            RecommandedScreen(),
          ],
        );
      },
      listener: (context, state) {
        setState(() {
          currentState = state;
        });
        _pageController!.animateToPage(state,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }
}
