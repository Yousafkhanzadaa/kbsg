import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kbsg/components/sign_button.dart';
import 'package:kbsg/screens/main_screens_controller/main_screen.dart';

class VarifyPage extends StatefulWidget {
  const VarifyPage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<VarifyPage> createState() => _VarifyPageState();
}

class _VarifyPageState extends State<VarifyPage> {
  int count = 0;
  Timer? countTimer;
  User? user;

  void sendVarificationEmail() async {
    try {
      await user!.sendEmailVerification();
      _time();
    } catch (e) {
      print("Sending varification cause error");
    }
  }

  void _time() {
    countTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 60) {
        timer.cancel();
      }
      setState(() {
        count += 1;
      });
    });
  }

  @override
  void dispose() {
    countTimer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    _time();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _varifyPart();
  }

  Widget _varifyPart() {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please Varify your email\nVarification email is sended to ${widget.email}.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: const Color(0xFF1F2937),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            (count <= 60)
                ? Text("You can resend email after 60 seconds: $count",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: const Color(0xFF1F2937),
                        fontWeight: FontWeight.w500,
                        fontSize: 12))
                : const SizedBox(),
            const SizedBox(
              height: 5,
            ),
            (count <= 60)
                ? const SignInOutButton(
                    label: "Resend Email",
                    bgColor: Colors.grey,
                  )
                : SignInOutButton(
                    label: "Resend Email",
                    onClick: () {
                      count = 0;
                      sendVarificationEmail();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
