import 'package:cbo_task/bottomnavigationbar/controller.dart';
import 'package:cbo_task/edit/controller/edit_controller.dart';
import 'package:cbo_task/homepage/controller/animation_controller.dart';
import 'package:cbo_task/homepage/controller/homepage_controller.dart';
import 'package:cbo_task/login/controller/login_controller.dart';
import 'package:cbo_task/widget/login_or_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnimateController(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        // home: const HomePage(),
        home: const LoginOrHomePage(),
      ),
    );
  }
}
