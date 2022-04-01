import 'package:flutter/material.dart';
import 'package:kbsg/components/sign_button.dart';
import 'package:kbsg/components/guide_message.dart';
import 'package:kbsg/constants/constants.dart';
import 'package:kbsg/screens/sign_in_out/sign_in_out_screen.dart';
// import 'package:kbsg/screens/sign_in_out/sign_in_out_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Constants _constants = Constants();
  int currentIndex = 0;

  List guideData = [
    "Welcome",
    "Login or Create acount to continue",
    "assets/images/illustrations/04.jpg"
  ];

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
            Expanded(child: _welcomeMessage()),
            SignInOutButton(
              label: "Create Account",
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInOutScreen(
                      login: false,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SignInOutButton(
              label: "Log In",
              bgColor: const Color(0xFFD1FAE5),
              textColor: Theme.of(context).primaryColor,
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInOutScreen(
                      login: true,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _termsMessage(context),
          ],
        ),
      ),
    );
  }

  Widget _welcomeMessage() {
    return GuideMessage(
      title: guideData[0],
      description: guideData[1],
      imageUrl: guideData[2],
    );
  }

  Widget _termsMessage(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText1,
        text: "By logging in or registering, you have agreed to ",
        children: <TextSpan>[
          TextSpan(
            text: "the Terms and Condition",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          const TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
