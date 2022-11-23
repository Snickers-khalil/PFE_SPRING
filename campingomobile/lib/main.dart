import 'package:Campingo/views/Annonces/Details.dart';
import 'package:Campingo/views/FirstBoard/BottomNav.dart';
import 'package:Campingo/views/LoginView/Login.dart';
import 'package:Campingo/views/RegisterView/Register.dart';
import 'package:flutter/material.dart';
import 'views/FirstBoard/FirstBoard.dart';
import 'views/HomeView/HomeView.dart';


void main() {runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNav(),
    title: "Campingo Flutter Project",
    initialRoute: '/onboarding',
        routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => new HomeView(),
          // '/settings': (BuildContext context) => new Settings(),
           "/onboarding": (BuildContext context) => new Onboarding(),
           "/login": (BuildContext context) => new Login(),
          // "/profile": (BuildContext context) => new Profile(),
          // "/articles": (BuildContext context) => new Articles(),
          // "/components": (BuildContext context) => new Components(),
          "/register": (BuildContext context) => new Register(),
          "/details": (BuildContext context) => new Details(),
        }
  ));
}
