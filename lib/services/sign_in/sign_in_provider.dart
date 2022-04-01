import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  String _code = "";
  bool success = false;

  get getCode => _code;
  get getSuccess => success;
  set setSuccess(bool value) => success = value;
  set setCode(String code) => _code = code;

  void signIn(String email, String password) async {
    try {
      setCode = "";
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => setSuccess = true);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for this email.');
        setCode = "User not found.\nPlease create your account first";
        setSuccess = false;
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        setCode = "Wrong Password";
        setSuccess = false;
        notifyListeners();
        // print('Wrong password.');
      }
    }
  }

  void verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      //   await user
      //       .sendEmailVerification()
      //       .then((value) => {success = true})
      //       .onError((error, stackTrace) => {success = false});
      // }
      setCode = "Email is not verified. Please verify you email.";
      notifyListeners();
    }
  }
}
