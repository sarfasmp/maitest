// @dart=2.9
import 'package:flutter/material.dart';
import 'package:maitexatest/provider/userListPro.dart';
import 'package:maitexatest/ui/homeScreen.dart';
import 'package:maitexatest/ui/userDetailScreen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserListProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(
        seconds: 8,
        navigateAfterSeconds:HomePage(),
        title: new Text(
          'Helo im sarfas',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue[200],
      ),
      //initialRoute: "/",
      routes: {
       // "/": (context)=>HomePage(),
        "/detailScreen": (context)=>UserDetailsScreen(),



      },
    );
  }
}
