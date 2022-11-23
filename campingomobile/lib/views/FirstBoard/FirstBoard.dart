import 'dart:ui';
import 'package:Campingo/constants/Theme.dart';
import 'package:Campingo/design/introduction_animation/introduction_animation_screen.dart';
import 'package:Campingo/main.dart';
import 'package:Campingo/views/FirstBoard/BottomNav.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/imgs/pic5.jpg"),
                        fit: BoxFit.cover))),
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/imgs/logo.gif", scale: 5.5),
                        SizedBox(height: 250.150),
                      ],
                    ),
                    
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("𝙳𝚎𝚜𝚒𝚐𝚗𝚎𝚍 𝙱𝚢 𝙰𝚖𝚒𝚗 & 𝙺𝚑𝚊𝚕𝚒𝚕",
                                style: TextStyle(
                                    color: NowUIColors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3)),
                            SizedBox(width: 5.0),
                            // Image.asset("assets/imgs/invision-white-slim.png",
                            //     scale: 7.0)
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("𝙲𝚘𝚍𝚎𝚍 𝙱𝚢 𝙰𝚖𝚒𝚗 & 𝙺𝚑𝚊𝚕𝚒𝚕",
                                style: TextStyle(
                                    color: NowUIColors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3)),
                            SizedBox(width: 10.0),
                          //   Image.asset("assets/imgs/creative-tim.png", scale: 7.0),
                           ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        //ignore: deprecated_member_use
                        child: FlatButton(
                          textColor: NowUIColors.white,
                          color: NowUIColors.logo,
                          onPressed: () {
                           //Navigator.pushReplacementNamed(context, '/login');
                           Navigator.push(context,MaterialPageRoute(builder:(context)=>IntroductionAnimationScreen()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 16, bottom: 16),
                              child: Text("GET STARTED",
                                  style: TextStyle(fontSize: 15.0))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
