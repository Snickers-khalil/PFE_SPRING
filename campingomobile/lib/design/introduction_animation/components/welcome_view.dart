import 'package:Campingo/views/FirstBoard/BottomNav.dart';
import 'package:Campingo/views/HomeView/HomeView.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  const WelcomeView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _welcomeFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _welcomeImageAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _welcomeImageAnimation,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 350),
                  child: Image.asset(
                    'assets/imgs/logo.gif',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SlideTransition(
                position: _welcomeFirstHalfAnimation,
                child: Text(
                  "Welcome",

                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),

                ),

              ),

              Padding(
                padding:
                    EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                child: Text(
                  "𝙽𝚘 𝚒𝚗𝚝𝚎𝚛𝚗𝚎𝚝 , 𝙽𝚘 𝚜𝚘𝚌𝚒𝚊𝚕 𝚖𝚎𝚍𝚒𝚊 . 𝚕𝚎𝚝𝚜 𝚐𝚘 𝚏𝚘𝚛 𝚊 𝚠𝚒𝚕𝚍  𝚌𝚊𝚖𝚙𝚒𝚗𝚐 𝚏𝚘𝚛 𝚜𝚘𝚖𝚎 𝚍𝚊𝚢𝚜 🍁",
                  textAlign: TextAlign.center,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
