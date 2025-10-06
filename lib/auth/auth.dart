import 'package:flutter/material.dart';
import 'package:todo/auth/login.dart';

import 'Register.dart';

class Auth extends StatelessWidget {
  static const String routName = "Auth";

  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Login"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorPadding: EdgeInsets.only(bottom: 4),
            tabs: [
              Tab(child: Text("Login")),
              Tab(child: Text("Register")),
            ],
          ),
        ),
        body: TabBarView(children: [Login(),Register()]),
      ),
    );
  }
}
