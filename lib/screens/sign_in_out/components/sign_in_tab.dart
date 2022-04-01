import 'package:flutter/material.dart';
import 'package:kbsg/components/google_button.dart';
import 'package:kbsg/components/sign_button.dart';
import 'package:kbsg/screens/sign_in_out/components/text_field.dart';
import 'package:kbsg/services/sign_in/sign_in_provider.dart';
import 'package:provider/provider.dart';

class SignInTab extends StatefulWidget {
  SignInTab({Key? key}) : super(key: key);

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(builder: (context, signInProvider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailPasswordField(
                  hint: "abc@gmail.com",
                  label: "Email Address",
                  controller: _emailController,
                  validator: (value) {
                    if (value == "") {
                      return "Please Enter you email";
                    }
                    if (!_emailRegExp.hasMatch(value!)) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                EmailPasswordField(
                  hint: "",
                  label: "Password",
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Wrong Password";
                    }
                    return null;
                  },
                ),
                // const Spacer(),

                const SizedBox(
                  height: 15,
                ),

                const SizedBox(height: 10),
                (!signInProvider.getSuccess)
                    ? Text(
                        signInProvider.getCode,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 25),
                SignInOutButton(
                  label: "Log In",
                  onClick: () async {
                    if (_formKey.currentState!.validate()) {
                      // FocusNode().unfocus();
                      FocusScope.of(context).requestFocus(FocusNode());
                      signInProvider.signIn(
                          _emailController!.text, _passwordController!.text);
                      showDialog(
                        context: context,
                        builder: (ctx) => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pop(context);

                      await Future.delayed(const Duration(seconds: 1));
                      if (signInProvider.getSuccess) {
                        Navigator.pop(context);
                      }
                    } else {}
                  },
                ),
                // const GoogleSignButton(label: "Sign In with Google"),
                // const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
