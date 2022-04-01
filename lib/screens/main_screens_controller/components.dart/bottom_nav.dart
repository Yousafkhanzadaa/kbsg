import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kbsg/bloc/nav_controller/active_nav.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      height: 55,
      color: Theme.of(context).primaryColor,
      items: const [
        Icon(
          Icons.home_outlined,
          size: 26,
          color: Colors.white,
        ),
        Icon(
          FontAwesomeIcons.bell,
          size: 22,
          color: Colors.white,
        ),
        Icon(
          FontAwesomeIcons.compass,
          size: 22,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        BlocProvider.of<ActiveNav>(context).currentScreen(index);
      },
    );
  }
}
