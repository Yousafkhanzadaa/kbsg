import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kbsg/screens/guide_screens/welcome_screen.dart';
import 'package:kbsg/screens/sign_varify_page.dart';
import 'package:kbsg/services/sign_in/sign_in_provider.dart';
import 'package:kbsg/services/sign_up/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SwitchScreens extends StatefulWidget {
  const SwitchScreens({Key? key}) : super(key: key);

  @override
  State<SwitchScreens> createState() => _SwitchScreensState();
}

class _SwitchScreensState extends State<SwitchScreens> {
  bool signOut = true;
  bool loading = true;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          signOut = true;
          loading = false;
        });
      } else {
        setState(() {
          signOut = false;
          loading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Consumer2<SignInProvider, SignUpProvider>(
        builder: (context, firstProvider, sencodPovider, child) {
      if (!loading) {
        return (firstProvider.getSuccess && user != null ||
                sencodPovider.getSuccess && user != null ||
                !signOut)
            ? const SignVarify()
            : const WelcomeScreen();
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      }
    });
  }
}
