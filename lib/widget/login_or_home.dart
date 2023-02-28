import 'package:cbo_task/bottomnavigationbar/bottomnavigathionbar.dart';
import 'package:cbo_task/homepage/view/homepage.dart';
import 'package:cbo_task/login/controller/login_controller.dart';
import 'package:cbo_task/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginOrHomePage extends StatelessWidget {
  const LoginOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<LoginController>(context);
    return Consumer<LoginController>(builder: (context, value, _) {
      return StreamBuilder(
        stream: value.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomBar();
          } else {
            return const LoginScreen();
          }
        },
      );
    });
  }
}
