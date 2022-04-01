import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kbsg/screens/main_screens_controller/main_screen.dart';
import 'package:kbsg/screens/sign_in_out/varify_view/varify_page.dart';

class SignVarify extends StatefulWidget {
  const SignVarify({Key? key}) : super(key: key);

  @override
  State<SignVarify> createState() => _SignVarifyState();
}

class _SignVarifyState extends State<SignVarify> {
  bool isEmailVarified = false;
  bool done = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      checkEmailVarify();
    });
  }

  void checkEmailVarify() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVarified = FirebaseAuth.instance.currentUser!.emailVerified;
      done = true;
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (done) {
      return isEmailVarified
          ? const MainScreen()
          : const VarifyPage(email: "Your");
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
  }
}
