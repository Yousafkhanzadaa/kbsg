import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpProvider extends ChangeNotifier {
  String _code = "";
  bool success = false;

  get getCode => _code;
  get getSuccess => success;
  set setSuccess(bool value) => success = value;

  set setCode(String code) => _code = code;

  void signUp(String email, String password) async {
    try {
      setCode = "";
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        verifyEmail();
      });
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setCode = "The password provided is too weak.";

        setSuccess = false;
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        setCode = "The account already exists for this email.";
        setSuccess = false;
        notifyListeners();
      }
    }
  }

  void verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user
          .sendEmailVerification()
          .then((value) => {success = true})
          .onError((error, stackTrace) => {success = false});
    }
    notifyListeners();
  }
}
