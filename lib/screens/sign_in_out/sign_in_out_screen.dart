import 'package:flutter/material.dart';
import 'package:kbsg/screens/sign_in_out/components/sign_in_tab.dart';
import 'package:kbsg/screens/sign_in_out/components/sign_up_tab.dart';
// import 'package:kbsg/screens/sign_in_out/varify_view/varify_page.dart';
// import 'package:kbsg/services/sign_up/sign_up_provider.dart';
// import 'package:provider/provider.dart';

class SignInOutScreen extends StatefulWidget {
  final bool login;
  const SignInOutScreen({Key? key, required this.login}) : super(key: key);

  @override
  _SignInOutScreenState createState() => _SignInOutScreenState();
}

class _SignInOutScreenState extends State<SignInOutScreen>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(
        length: 2, vsync: this, initialIndex: (widget.login) ? 0 : 1);
    // varify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: _tabBar()),
              Expanded(flex: 9, child: _tabView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TabBar(
        controller: _controller,
        indicatorColor: Theme.of(context).primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 2,
        labelColor: Theme.of(context).primaryColor,
        labelStyle: Theme.of(context).textTheme.headline5,
        unselectedLabelColor: const Color(0xFF89909E),
        tabs: const [
          Tab(
            text: 'Log In',
          ),
          Tab(
            text: 'Create Accout',
          ),
        ],
      ),
    );
  }

  Widget _tabView() {
    return TabBarView(
      controller: _controller,
      children: [
        SignInTab(),
        const SignUpTab(),
      ],
    );
  }
}
