import 'package:flutter/material.dart';
import 'package:kbsg/components/google_button.dart';
import 'package:kbsg/components/sign_button.dart';
import 'package:kbsg/screens/sign_in_out/components/text_field.dart';
import 'package:kbsg/screens/sign_in_out/varify_view/varify_page.dart';
import 'package:kbsg/services/sign_up/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  Widget build(BuildContext context) {
    // SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    return Consumer<SignUpProvider>(
      builder: (context, signUpProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const EmailPasswordField(
                    hint: "",
                    label: "Registration code",
                  ),
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
                        return "Password should have more than 8 characters.";
                      }
                      return null;
                    },
                  ),
                  // const Spacer(),
                  const SizedBox(height: 10),
                  (!signUpProvider.getSuccess)
                      ? Text(
                          signUpProvider.getCode,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 25),
                  SignInOutButton(
                    label: "Create Account",
                    onClick: () async {
                      if (_formKey.currentState!.validate()) {
                        // FocusNode().unfocus();
                        FocusScope.of(context).requestFocus(FocusNode());
                        signUpProvider.signUp(
                            "yousafkhanzadaa@gmail.com", "12345678");
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
                        if (signUpProvider.getSuccess) {
                          Navigator.pop(context);
                        }
                        // if (signUpProvider.getSuccess) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const VarifyPage(email: "dd")));
                        // }
                      } else {
                        print("Invalid");
                      }
                    },
                  ),
                  // SignInOutButton(
                  //   label: "Create Account",
                  //   onClick: () {
                  //     if (_formKey.currentState!.validate()) {
                  //       signUpProvider.signUp(
                  //           "yousafkhanzadaa@gmail.com", "12345678");
                  //     } else {
                  //       print("Invalid");
                  //     }
                  //   },
                  // ),
                  const SizedBox(height: 15),
                  // const GoogleSignButton(label: "Sign Up with Google"),
                  // const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
