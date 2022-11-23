import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _introductionanimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/imgs/cam.gif',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "𝙲𝚊𝚖𝚙𝚒𝚗𝚐𝚘",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: Text(
                "𝑇ℎ𝑒 𝑓𝑖𝑟𝑠𝑡 𝑇𝑢𝑛𝑖𝑠𝑖𝑎𝑛 𝑎𝑝𝑝𝑙𝑖𝑐𝑎𝑡𝑖𝑜𝑛 𝑡ℎ𝑎𝑡 𝑏𝑟𝑖𝑛𝑔𝑠 𝑡𝑜𝑔𝑒𝑡ℎ𝑒𝑟 𝑙𝑜𝑣𝑒𝑟𝑠 𝑜𝑓 𝑑𝑜𝑚𝑒𝑠𝑡𝑖𝑐 𝑡𝑜𝑢𝑟𝑖𝑠𝑚",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding: EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: Color(0xff132137),
                  ),
                  child: Text(
                    "Let's begin",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
