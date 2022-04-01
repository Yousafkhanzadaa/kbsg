import 'package:flutter/material.dart';
import 'package:kbsg/components/basic_details_card.dart';
import 'package:kbsg/screens/main_screens/profile_edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List basicDetails = [
    [
      "Fee Competion",
      "Clear till July, 2022",
      "https://media.istockphoto.com/vectors/isometric-businessman-hand-putting-gold-coin-into-graduation-cap-vector-id1225146945?k=20&m=1225146945&s=612x612&w=0&h=HWMtI4ACfm9diVhpcBKA67XGu2O75xvsKp2nAVdwO7A="
    ],
    [
      "Group/Petrol",
      "Leapord Petrol",
      "https://cdn.dribbble.com/users/6024852/screenshots/15481372/media/e7ed7af61495f0eb88e61be5ea4af52e.jpg?compress=1&resize=400x300"
    ],
    [
      "Duty Start at",
      "26 Feb, 2022",
      "https://thumbs.dreamstime.com/b/illustration-cartoon-little-boy-scout-cartoon-little-boy-scout-124136307.jpg"
    ],
  ];
  List updatesList = [
    [
      "Salman Ali (GSL)",
      "An important meeting is going to be held at 22 June, 2022. Get ready!",
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    ],
    [
      "Amjad Khan (SPL)",
      "New grouping list is ready. Please Check it our.",
      "http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/07/1080p-New-Cool-Whatsapp-Dp-Profile-Images-pictures-hd-1-300x300.jpg"
    ],
    [
      "Yousuf (Programmer)",
      "New classes are starting at TechZoid form tommorrow. Please apply if you are interested in App developement, Web development, App/Web/Graphic designing.",
      "http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/07/1080p-New-Cool-Whatsapp-Dp-Profile-Images-pictures-hd-1-300x300.jpg"
    ],
    [
      "Azeem Pana (GS)",
      "Please submit your fees..",
      "http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/07/1080p-New-Cool-Whatsapp-Dp-Profile-Images-pictures-hd-1-300x300.jpg"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return _userData();
  }

  Widget _userData() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _dpNameEditBtn(),
          const SizedBox(height: 20),
          _updatesDetails(),
        ],
      ),
    );
  }

  Widget _dpNameEditBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _dpName(),
        const Spacer(),
        _editButton(),
      ],
    );
  }

  Widget _dpName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _dp(),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Amjad Rehman",
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          "Boy Scout",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _dp() {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
              "https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _editButton() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditProfileScreen()));
        },
        child: Text(
          "Edit profile",
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

  Widget _updatesDetails() {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Basic Information",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _basicDetails(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Updates",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _updates(),
        ],
      ),
    );
  }

  Widget _basicDetails() {
    return Column(
      children: basicDetails
          .map((e) => BasicDetails(illustratin: e[2], title: e[0], desc: e[1]))
          .toList(),
    );
  }

  Widget _updates() {
    return Column(
      children: updatesList
          .map((e) => BasicDetails(illustratin: e[2], title: e[0], desc: e[1]))
          .toList(),
    );
  }
}
