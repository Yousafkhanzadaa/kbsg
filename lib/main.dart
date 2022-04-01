import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:kbsg/screens/sign_in_out/sign_in_out_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:kbsg/screens/sign_varify_page.dart';
import 'package:kbsg/services/sign_in/sign_in_provider.dart';
import 'package:kbsg/services/sign_up/sign_up_provider.dart';
import 'package:kbsg/switcher/switcher.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:kbsg/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Scouts());
}

class Scouts extends StatefulWidget {
  const Scouts({Key? key}) : super(key: key);

  @override
  _ScoutState createState() => _ScoutState();
}

class _ScoutState extends State<Scouts> {
  CustomTheme customTheme = CustomTheme();
  // User? user;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
          create: (_) => SignInProvider(),
        ),
        ChangeNotifierProvider<SignUpProvider>(
          create: (_) => SignUpProvider(),
        )
      ],
      child: MaterialApp(
        title: "Text",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF32B768),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          fontFamily: "Inter",
          textTheme: customTheme.textTheme,
          colorScheme: customTheme.colorScheme,
        ),
        home: const SwitchScreens(),
      ),
    );
  }
}
